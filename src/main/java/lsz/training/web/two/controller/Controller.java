package lsz.training.web.two.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class Controller {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/bye")
    public Bye bye(@RequestParam(defaultValue = "World") String name) {
        return new Bye(counter.incrementAndGet(), String.format(template, name));
    }
}