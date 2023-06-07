package com.stressthem.app.initialization;

import com.stressthem.app.domain.entities.Comment;
import com.stressthem.app.repositories.CommentRepository;
import com.stressthem.app.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CommentsInit implements CommandLineRunner {
    private UserRepository userRepository;
    private CommentRepository commentRepository;

    @Autowired
    public CommentsInit(UserRepository userRepository, CommentRepository commentRepository) {
        this.userRepository = userRepository;
        this.commentRepository = commentRepository;
    }

    @Override
    public void run(String... args) throws Exception {

        if (commentRepository.count() == 0) {

            Comment comment = new Comment(5, "The best stresser on the market with the cheapest prices...", userRepository.findUserByUsername("Admin").get());
            Comment commentTwo = new Comment(4, "Bypasses cloudflare!!!", userRepository.findUserByUsername("user").get());

            commentRepository.saveAll(List.of(comment, commentTwo));
        }


    }
}
