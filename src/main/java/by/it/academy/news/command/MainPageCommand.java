package by.it.academy.news.command;

import by.it.academy.news.bean.News;
import by.it.academy.news.service.NewsService;
import by.it.academy.news.service.exceptions.NewsServiceException;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/news")
public class MainPageCommand {
    private static final int RECORD_PER_PAGE = 4;
    private static final String NEWS_ATTRIBUTE = "news";
    private static final String PATH_VARIABLE_ID = "id";
    private static final String ALL_NEWS_ATTRIBUTE = "allNews";
    private static final String PAGE_COUNT_ATTRIBUTE = "pageCount";
    private static final String UPDATE_FAILED_MESSAGE = "Update failed";
    private static final String NEWS_WAS_UPDATED_MESSAGE = "News was updated!";
    private static final String CURRENT_PAGE_NUMBER_ATTRIBUTE = "currentPageNumber";
    private static final String GO_TO_MAIN_PAGE = "main-page";
    private static final String GO_TO_UPDATE_PAGE = "update-page";
    private static final String GO_TO_SINGLE_NEWS_PAGE = "single-news-page";
    private static final String GO_TO_CREATE_NEWS_PAGE = "create-news-page";
    private static final String CSS_ATTRIBUTE = "css";
    private static final String REDIRECT_NEWS_START_PAGE = "redirect:/news/start?page=";
    private static final String MSG_ATTRIBUTE = "msg";
    private static final String CSS_DANGER_VALUE = "danger";
    private static final String CSS_SUCCESS_VALUE = "success";

    @Autowired
    private NewsService newsService;

    @InitBinder
    public void initBinder(final WebDataBinder dataBinder) {
        final StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/start")
    public String toMainPage(@RequestParam(name = "page", defaultValue = "1") int page, final Model model,
                             final HttpSession httpSession) throws NewsServiceException {
        final int newsCount = newsService.getNumberOfAllNews();
        final int pageCount = (int) Math.ceil(newsCount * 1.0 / RECORD_PER_PAGE);
        final List<News> allNews =
                newsService.getAllNews((page - 1) * RECORD_PER_PAGE, RECORD_PER_PAGE);

        model.addAttribute(ALL_NEWS_ATTRIBUTE, allNews);
        model.addAttribute(PAGE_COUNT_ATTRIBUTE, pageCount);
        httpSession.setAttribute(CURRENT_PAGE_NUMBER_ATTRIBUTE, page);

        return GO_TO_MAIN_PAGE;
    }

    @GetMapping("/{id}")
    public String toSingleNewsPage(@PathVariable(PATH_VARIABLE_ID) int id, final Model model) throws NewsServiceException {
        final News singleNews = newsService.getSingleNews(id);
        model.addAttribute(NEWS_ATTRIBUTE, singleNews);

        return GO_TO_SINGLE_NEWS_PAGE;
    }


    @RequestMapping("/toAddNewsPage")
    public String toAddNewsPage(Model model) throws NewsServiceException {
        News theNews = new News();
        model.addAttribute(NEWS_ATTRIBUTE, theNews);
        return GO_TO_CREATE_NEWS_PAGE;
    }

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login() {
        return "login";
    }


    @PostMapping("/addNews")
    public ModelAndView addNews(@Valid @ModelAttribute("news") News news, BindingResult theBindingResult) throws NewsServiceException {
        ModelAndView modelAndView = new ModelAndView();
        if (theBindingResult.hasErrors()) {
            modelAndView.setViewName(GO_TO_CREATE_NEWS_PAGE);
        } else {
            newsService.addNews(news);
            modelAndView.setViewName("redirect:/news/start");
        }
        return modelAndView;
    }

    @RequestMapping("/showUpdatePage")
    public String toUpdatePage(@RequestParam(PATH_VARIABLE_ID) int id, final Model model)
            throws NewsServiceException {
        if (!model.containsAttribute(NEWS_ATTRIBUTE)) {
            final News singleNews = newsService.getSingleNews(id);
            model.addAttribute(NEWS_ATTRIBUTE, singleNews);
        }
        return GO_TO_UPDATE_PAGE;
    }

    @PutMapping("/{id}")
    public String updateNews(@PathVariable(PATH_VARIABLE_ID) int id, final HttpSession httpSession,
                             @Valid @ModelAttribute(NEWS_ATTRIBUTE) final News news, final BindingResult bindingResult,
                             final RedirectAttributes redirectAttributes)
            throws NewsServiceException {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute(
                    "org.springframework.validation.BindingResult.news", bindingResult);
            redirectAttributes.addFlashAttribute(NEWS_ATTRIBUTE, news);
            redirectAttributes.addFlashAttribute(CSS_ATTRIBUTE, CSS_DANGER_VALUE);
            redirectAttributes.addFlashAttribute(MSG_ATTRIBUTE, UPDATE_FAILED_MESSAGE);
            return "redirect:/news/showUpdatePage?id=" + id;
        } else {
            newsService.updateNews(news);
            redirectAttributes.addFlashAttribute(CSS_ATTRIBUTE, CSS_SUCCESS_VALUE);
            redirectAttributes.addFlashAttribute(MSG_ATTRIBUTE, NEWS_WAS_UPDATED_MESSAGE);

            int currentPage = (int) httpSession.getAttribute(CURRENT_PAGE_NUMBER_ATTRIBUTE);

            return REDIRECT_NEWS_START_PAGE + currentPage;
        }
    }

    @DeleteMapping("/{id}")
    public String deleteNews(@PathVariable(PATH_VARIABLE_ID) int id, final RedirectAttributes redirectAttributes,
                             final HttpSession httpSession) throws NewsServiceException {
        newsService.deleteNews(id);

        redirectAttributes.addFlashAttribute(CSS_ATTRIBUTE, CSS_SUCCESS_VALUE);
        redirectAttributes.addFlashAttribute(MSG_ATTRIBUTE, "News was deleted!");

        int currentPage = (int) httpSession.getAttribute(CURRENT_PAGE_NUMBER_ATTRIBUTE);

        return REDIRECT_NEWS_START_PAGE + currentPage;
    }

    @ExceptionHandler(NewsServiceException.class)
    public String exceptionHandler(final RedirectAttributes redirectAttributes, final HttpSession httpSession) {
        redirectAttributes.addFlashAttribute(CSS_ATTRIBUTE, CSS_DANGER_VALUE);
        redirectAttributes.addFlashAttribute(
                MSG_ATTRIBUTE, "Operation failed, please try again later...");

        int currentPage = (int) httpSession.getAttribute(CURRENT_PAGE_NUMBER_ATTRIBUTE);

        return REDIRECT_NEWS_START_PAGE + currentPage;
    }
}
