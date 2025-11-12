package com.politv.politv_api.repository;

import com.politv.politv_api.model.Trivia;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TriviaRepository extends JpaRepository<Trivia, Integer> { }

