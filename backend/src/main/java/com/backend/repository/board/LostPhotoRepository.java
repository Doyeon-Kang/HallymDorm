package com.backend.repository.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.model.board.LostPhoto;

public interface LostPhotoRepository extends JpaRepository<LostPhoto, Long> {
    List<LostPhoto> findByBoardLostId(Long lostId);

    LostPhoto findById(String id);

    @Transactional
    void deleteByBoardLostId(Long storeId);

    @Transactional
    void deleteById(String id);
}