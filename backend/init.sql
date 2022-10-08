-- MySQL Script generated by MySQL Workbench
-- Fri Sep  2 21:57:16 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema dormitory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dormitory` DEFAULT CHARACTER SET utf8 ;
USE `dormitory` ;
SET GLOBAL time_zone = 'Asia/Seoul';

CREATE TABLE IF NOT EXISTS `dormitory`.`test_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `no` VARCHAR(100) NOT NULL COMMENT '학번',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dormitory`.`user_member_parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`user_member_parent` (
  `id` VARCHAR(200) NOT NULL,
  `no` INT NOT NULL COMMENT '학번',
  `par_name` VARCHAR(50) NULL COMMENT '보호자 이름',
  `par_rel` VARCHAR(10) NULL COMMENT '보호자 관계',
  `par_tel_no` VARCHAR(20) NULL COMMENT '보호자 연락처',
  `home_tel_no` VARCHAR(20) NULL COMMENT '자택 전화',
  PRIMARY KEY (`id`, `no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`point` (
  `id` VARCHAR(200) NOT NULL,
  `no` INT NOT NULL COMMENT '학번',
  `pt_reason` VARCHAR(40) NULL COMMENT '상/벌점 사유',
  `proc_date` DATE NULL COMMENT '처리날짜',
  `add_date` DATE NULL COMMENT '입력날짜',
  `score` VARCHAR(10) NULL COMMENT '점수',
  PRIMARY KEY (`id`, `no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_resign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_resign` (
  `no` INT NOT NULL COMMENT '학번',
  `apply_date` DATE NOT NULL,
  `res_date` DATE NULL COMMENT '퇴사 예정일',
  `res_reason` VARCHAR(200) NULL COMMENT '퇴사 사유',
  PRIMARY KEY (`no`, `apply_date`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`user_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`user_member` (
  `id` VARCHAR(200) NOT NULL,
  `no` INT NOT NULL COMMENT '학번',
  `eng_name` VARCHAR(50) NULL COMMENT '영문이름',
  `chn_name` VARCHAR(50) NULL COMMENT '한자이름',
  `grade` INT NULL COMMENT '학년',
  `point` INT NULL COMMENT '상/벌점',
  `res_fac` INT NULL COMMENT '거주관',
  `res_room` INT NULL COMMENT '거주호실',
  `gender` VARCHAR(1) NULL COMMENT '성별',
  `nation` VARCHAR(50) NULL COMMENT '국적',
  `univ` VARCHAR(50) NULL COMMENT '대학',
  `dept` VARCHAR(50) NULL COMMENT '학과',
  `aca_status` VARCHAR(20) NULL COMMENT '학적상태',
  `addr` VARCHAR(200) NULL COMMENT '주소',
  `tel_no` VARCHAR(20) NULL COMMENT '연락처',
  `user_member_parent_id` VARCHAR(200),
  `user_member_parent_no` INT,
  `point_id` VARCHAR(200),
  `point_no` INT,
  `apply_consult_cns_no` INT,
  `apply_consult_no` INT,
  `apply_studyroom_no1` INT,
  `apply_sleepout_no` INT,
  `apply_sleepout_date` DATE,
  `apply_resign_no` INT,
  `apply_resign_apply_date` DATE,
  PRIMARY KEY (`id`, `no`, `user_member_parent_id`, `user_member_parent_no`, `point_id`, `point_no`, `apply_consult_cns_no`, `apply_consult_no`, `apply_studyroom_no1`, `apply_sleepout_no`, `apply_sleepout_date`, `apply_resign_no`, `apply_resign_apply_date`),
  INDEX `fk_user_member_user_member_parent_idx` (`user_member_parent_id` ASC, `user_member_parent_no` ASC) VISIBLE,
  INDEX `fk_user_member_point1_idx` (`point_id` ASC, `point_no` ASC) VISIBLE,
  INDEX `fk_user_member_apply_resign1_idx` (`apply_resign_no` ASC, `apply_resign_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_user_member_user_member_parent`
    FOREIGN KEY (`user_member_parent_id` , `user_member_parent_no`)
    REFERENCES `dormitory`.`user_member_parent` (`id` , `no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_member_point1`
    FOREIGN KEY (`point_id` , `point_no`)
    REFERENCES `dormitory`.`point` (`id` , `no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_member_apply_resign1`
    FOREIGN KEY (`apply_resign_no` , `apply_resign_apply_date`)
    REFERENCES `dormitory`.`apply_resign` (`no` , `apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_join` (
  `no` INT NOT NULL COMMENT '학번',
  `apply_date` DATE NOT NULL,
  `hope_fac_1` INT NULL COMMENT '희망시설1',
  `hope_fac_2` INT NULL COMMENT '희망시설2',
  `hope_fac_3` INT NULL COMMENT '희망시설3',
  `hope_fac_4` INT NULL COMMENT '희망시설4',
  `hope_fac_5` INT NULL COMMENT '희망시설5',
  `hope_fac_6` INT NULL COMMENT '희망시설6',
  `period` INT NULL COMMENT '사용기간',
  `single_yn` VARCHAR(1) NULL COMMENT '1인실 사용신청',
  `pri_ent` VARCHAR(1) NULL COMMENT '우선입사 대상자',
  `fgn_mate` VARCHAR(1) NULL COMMENT '외국인 룸메이트',
  `accpm_ent` VARCHAR(50) NULL COMMENT '동반 입실자',
  `par_mes_yn` VARCHAR(1) NULL COMMENT '보호자 문자 수신사항',
  `pri_ent_yn` VARCHAR(1) NULL COMMENT '우선입사대상서류유무',
  `pri_ent_doc` VARCHAR(45) NULL COMMENT '우선입사대상서류제출',
  `user_member_id` VARCHAR(200) NOT NULL,
  `user_member_no` INT NOT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NOT NULL,
  `user_member_user_member_parent_no` INT NOT NULL,
  `user_member_point_id` VARCHAR(200) NOT NULL,
  `user_member_point_no` INT NOT NULL,
  `user_member_apply_consult_cns_no` INT NOT NULL,
  `user_member_apply_consult_no` INT NOT NULL,
  `user_member_apply_studyroom_no1` INT NOT NULL,
  `user_member_apply_sleepout_no` INT NOT NULL,
  `user_member_apply_sleepout_date` DATE NOT NULL,
  PRIMARY KEY (`no`, `apply_date`, `user_member_id`, `user_member_no`, `user_member_user_member_parent_id`, `user_member_user_member_parent_no`, `user_member_point_id`, `user_member_point_no`, `user_member_apply_consult_cns_no`, `user_member_apply_consult_no`, `user_member_apply_studyroom_no1`, `user_member_apply_sleepout_no`, `user_member_apply_sleepout_date`),
  INDEX `fk_apply_join_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC, `user_member_point_id` ASC, `user_member_point_no` ASC, `user_member_apply_consult_cns_no` ASC, `user_member_apply_consult_no` ASC, `user_member_apply_studyroom_no1` ASC, `user_member_apply_sleepout_no` ASC, `user_member_apply_sleepout_date` ASC) VISIBLE,
  CONSTRAINT `fk_apply_join_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no` , `user_member_point_id` , `user_member_point_no` , `user_member_apply_consult_cns_no` , `user_member_apply_consult_no` , `user_member_apply_studyroom_no1` , `user_member_apply_sleepout_no` , `user_member_apply_sleepout_date`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no` , `point_id` , `point_no` , `apply_consult_cns_no` , `apply_consult_no` , `apply_studyroom_no1` , `apply_sleepout_no` , `apply_sleepout_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `studentno` VARCHAR(200) NOT NULL COMMENT '아이디',
  `name` VARCHAR(50) NULL COMMENT '이름',
  `password` VARCHAR(120) NULL COMMENT '비밀번호',
  `email` VARCHAR(100) NULL COMMENT '이메일',
  `join_yn` VARCHAR(1) NULL COMMENT '입사여부',
  -- `div` VARCHAR(20) NULL COMMENT '회원구분',
  `user_member_id` VARCHAR(200) NULL,
  `user_member_no` INT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NULL,
  `user_member_user_member_parent_no` INT NULL,
  `apply_join_no` INT NULL,
  `apply_join_apply_date` DATE NULL,
  PRIMARY KEY (`id`, `studentno`),
  INDEX `fk_user_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC) VISIBLE,
  INDEX `fk_user_apply_join1_idx` (`apply_join_no` ASC, `apply_join_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_user_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_apply_join1`
    FOREIGN KEY (`apply_join_no` , `apply_join_apply_date`)
    REFERENCES `dormitory`.`apply_join` (`no` , `apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dormitory`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`role` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NULL,
    PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dormitory`.`board_notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_notice` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '게시글  아이디',
  `writer_studentno` VARCHAR(200) NOT NULL COMMENT '작성자 학번',
  `writer_name` VARCHAR(200) NOT NULL COMMENT '작성자',
  `title` VARCHAR(200) NULL COMMENT '제목',
  `content` VARCHAR(1000) NULL COMMENT '내용',
  `views` INT NULL COMMENT '조회수',
  `date` DATETIME COMMENT '작성일자',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dormitory`.`board_notice_comments`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dormitory`.`board_notice_comments` (
--   `id` INT NOT NULL AUTO_INCREMENT COMMENT '댓글아이디',
--   `noticeid` INT NOT NULL COMMENT '게시글아이디',
--   `comment` VARCHAR(500) NULL COMMENT '댓글내용',
--   `writerid` VARCHAR(200) NOT NULL COMMENT '댓글 작성자 학번',
--   `writername` VARCHAR(200) NOT NULL COMMENT '댓글 작성자',
--   `date` DATETIME NULL COMMENT '댓글 작성일',
--   PRIMARY KEY (`id`, `noticeid`)
-- )
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_repair`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_repair` (
  `post_id` INT NOT NULL COMMENT '게시글 아이디',
  `id` VARCHAR(200) NOT NULL COMMENT '작성자 아이디',
  `title` VARCHAR(200) NULL COMMENT '제목',
  `contents` VARCHAR(1000) NULL COMMENT '내용',
  `views` INT NULL COMMENT '조회수',
  `date` DATE NULL COMMENT '작성일자',
  `progress` VARCHAR(20) NULL COMMENT '진행사항',
  `user_member_id` VARCHAR(200) NOT NULL,
  `user_member_no` INT NOT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NOT NULL,
  `user_member_user_member_parent_no` INT NOT NULL,
  `user_member_point_id` VARCHAR(200) NOT NULL,
  `user_member_point_no` INT NOT NULL,
  `user_member_apply_consult_cns_no` INT NOT NULL,
  `user_member_apply_consult_no` INT NOT NULL,
  `user_member_apply_studyroom_no1` INT NOT NULL,
  `user_member_apply_sleepout_no` INT NOT NULL,
  `user_member_apply_sleepout_date` DATE NOT NULL,
  `user_member_apply_resign_no` INT NOT NULL,
  `user_member_apply_resign_apply_date` DATE NOT NULL,
  PRIMARY KEY (`post_id`, `user_member_id`, `user_member_no`, `user_member_user_member_parent_id`, `user_member_user_member_parent_no`, `user_member_point_id`, `user_member_point_no`, `user_member_apply_consult_cns_no`, `user_member_apply_consult_no`, `user_member_apply_studyroom_no1`, `user_member_apply_sleepout_no`, `user_member_apply_sleepout_date`, `user_member_apply_resign_no`, `user_member_apply_resign_apply_date`, `id`),
  INDEX `fk_board_repair_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC, `user_member_point_id` ASC, `user_member_point_no` ASC, `user_member_apply_consult_cns_no` ASC, `user_member_apply_consult_no` ASC, `user_member_apply_studyroom_no1` ASC, `user_member_apply_sleepout_no` ASC, `user_member_apply_sleepout_date` ASC, `user_member_apply_resign_no` ASC, `user_member_apply_resign_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_board_repair_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no` , `user_member_point_id` , `user_member_point_no` , `user_member_apply_consult_cns_no` , `user_member_apply_consult_no` , `user_member_apply_studyroom_no1` , `user_member_apply_sleepout_no` , `user_member_apply_sleepout_date` , `user_member_apply_resign_no` , `user_member_apply_resign_apply_date`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no` , `point_id` , `point_no` , `apply_consult_cns_no` , `apply_consult_no` , `apply_studyroom_no1` , `apply_sleepout_no` , `apply_sleepout_date` , `apply_resign_no` , `apply_resign_apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_repair_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_repair_comments` (
  `comment_id` INT NOT NULL COMMENT '댓글아이디',
  `post_id` INT NOT NULL COMMENT '게시판 아이디',
  `comment` VARCHAR(500) NULL COMMENT '댓글내용',
  `writer_id` VARCHAR(200) NULL COMMENT '댓글 작성자',
  `date` DATE NULL COMMENT '댓글 작성일',
  `parent_id` INT NULL COMMENT '부모글 아이디',
  `board_repair_post_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `comment_id`, `board_repair_post_id`),
  INDEX `fk_board_repair_comments_board_repair1_idx` (`board_repair_post_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_repair_comments_board_repair1`
    FOREIGN KEY (`board_repair_post_id`)
    REFERENCES `dormitory`.`board_repair` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_store` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '게시글 아이디',
  `writer_studentno` VARCHAR(200) NOT NULL COMMENT '작성자 학번',
  `writer_name` VARCHAR(200) NOT NULL COMMENT '작성자',
  `title` VARCHAR(200) NULL COMMENT '제목',
  `content` VARCHAR(1000) NULL COMMENT '내용',
  `views` INT NULL COMMENT '조회수',
  `date` DATETIME COMMENT '작성일자',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_store_comments`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `dormitory`.`board_store_comments` (
--   `comment_id` INT NOT NULL COMMENT '댓글아이디',
--   `post_id` INT NOT NULL COMMENT '게시판 아이디',
--   `comment` VARCHAR(500) NULL COMMENT '댓글내용',
--   `writer_id` VARCHAR(200) NULL COMMENT '댓글 작성자',
--   `date` DATE NULL COMMENT '댓글 작성일',
--   `parent_id` INT NULL COMMENT '부모글 아이디',
--   `board_store_post_id` INT NOT NULL,
--   PRIMARY KEY (`post_id`, `comment_id`, `board_store_post_id`),
--   INDEX `fk_board_store_comments_board_store1_idx` (`board_store_post_id` ASC) VISIBLE,
--   CONSTRAINT `fk_board_store_comments_board_store1`
--     FOREIGN KEY (`board_store_post_id`)
--     REFERENCES `dormitory`.`board_store` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_lost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_lost` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '게시글 아이디',
  `writer_studentno` VARCHAR(200) NOT NULL COMMENT '작성자 학번',
  `writer_name` VARCHAR(200) NOT NULL COMMENT '작성자',
  `title` VARCHAR(200) NULL COMMENT '제목',
  `contents` VARCHAR(1000) NULL COMMENT '내용',
  `views` INT NULL COMMENT '조회수',
  `date` DATETIME COMMENT '작성일자',
  `user_member_id` VARCHAR(200) NULL,
  `user_member_no` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_lost_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC) VISIBLE,
  CONSTRAINT `fk_board_lost_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no`)
    REFERENCES `dormitory`.`user_member` (`id` , `no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`board_lost_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_lost_comments` (
  `comment_id` INT NOT NULL COMMENT '댓글아이디',
  `post_id` INT NOT NULL COMMENT '게시판 아이디',
  `comment` VARCHAR(500) NULL COMMENT '댓글내용',
  `writer_id` VARCHAR(200) NULL COMMENT '댓글 작성자',
  `date` DATE NULL COMMENT '댓글 작성일',
  `parent_id` INT NULL COMMENT '부모글 아이디',
  `board_lost_post_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `comment_id`, `board_lost_post_id`),
  INDEX `fk_board_lost_comments_board_lost1_idx` (`board_lost_post_id` ASC) VISIBLE,
  CONSTRAINT `fk_board_lost_comments_board_lost1`
    FOREIGN KEY (`board_lost_post_id`)
    REFERENCES `dormitory`.`board_lost` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_consult_dtl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_consult_dtl` (
  `cns_no` INT NOT NULL COMMENT '상담번호',
  `no` INT NOT NULL COMMENT '신청자 학번',
  `email` VARCHAR(100) NULL COMMENT '신청자 이메일',
  `cns_field` VARCHAR(50) NULL COMMENT '상담분야',
  `cns_contents` VARCHAR(1000) NULL COMMENT '상담내용',
  `cns_ok_time` TIME NULL COMMENT '상담가능시간',
  PRIMARY KEY (`cns_no`, `no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_consult`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_consult` (
  `cns_no` INT NOT NULL COMMENT '상담 번호',
  `no` INT NOT NULL COMMENT '신청자 학번',
  `name` VARCHAR(50) NULL COMMENT '신청자 이름',
  `cns_field` VARCHAR(50) NULL COMMENT '상담분야',
  `date` DATE NULL COMMENT '신청일자',
  `progress` VARCHAR(20) NULL COMMENT '진행상태',
  `apply_consult_dtl_cns_no` INT NOT NULL,
  `apply_consult_dtl_no` INT NOT NULL,
  `user_member_id` VARCHAR(200) NOT NULL,
  `user_member_no` INT NOT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NOT NULL,
  `user_member_user_member_parent_no` INT NOT NULL,
  `user_member_point_id` VARCHAR(200) NOT NULL,
  `user_member_point_no` INT NOT NULL,
  `user_member_apply_consult_cns_no` INT NOT NULL,
  `user_member_apply_consult_no` INT NOT NULL,
  `user_member_apply_studyroom_no1` INT NOT NULL,
  `user_member_apply_sleepout_no` INT NOT NULL,
  `user_member_apply_sleepout_date` DATE NOT NULL,
  `user_member_apply_resign_no` INT NOT NULL,
  `user_member_apply_resign_apply_date` DATE NOT NULL,
  PRIMARY KEY (`cns_no`, `no`, `apply_consult_dtl_cns_no`, `apply_consult_dtl_no`, `user_member_id`, `user_member_no`, `user_member_point_id`, `user_member_point_no`, `user_member_apply_consult_cns_no`, `user_member_apply_consult_no`, `user_member_apply_studyroom_no1`, `user_member_apply_sleepout_no`, `user_member_apply_sleepout_date`, `user_member_apply_resign_no`, `user_member_apply_resign_apply_date`),
  INDEX `fk_apply_consult_apply_consult_dtl1_idx` (`apply_consult_dtl_cns_no` ASC, `apply_consult_dtl_no` ASC) VISIBLE,
  INDEX `fk_apply_consult_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC, `user_member_point_id` ASC, `user_member_point_no` ASC, `user_member_apply_consult_cns_no` ASC, `user_member_apply_consult_no` ASC, `user_member_apply_studyroom_no1` ASC, `user_member_apply_sleepout_no` ASC, `user_member_apply_sleepout_date` ASC, `user_member_apply_resign_no` ASC, `user_member_apply_resign_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_apply_consult_apply_consult_dtl1`
    FOREIGN KEY (`apply_consult_dtl_cns_no` , `apply_consult_dtl_no`)
    REFERENCES `dormitory`.`apply_consult_dtl` (`cns_no` , `no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apply_consult_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no` , `user_member_point_id` , `user_member_point_no` , `user_member_apply_consult_cns_no` , `user_member_apply_consult_no` , `user_member_apply_studyroom_no1` , `user_member_apply_sleepout_no` , `user_member_apply_sleepout_date` , `user_member_apply_resign_no` , `user_member_apply_resign_apply_date`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no` , `point_id` , `point_no` , `apply_consult_cns_no` , `apply_consult_no` , `apply_studyroom_no1` , `apply_sleepout_no` , `apply_sleepout_date` , `apply_resign_no` , `apply_resign_apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`schedule` (
  `sch_id` INT NOT NULL COMMENT '일정아이디',
  `title` VARCHAR(200) NULL COMMENT '일정제목',
  `color` VARCHAR(10) NULL COMMENT '색상',
  `st_date` DATE NULL COMMENT '시작일자',
  `ed_date` DATE NULL COMMENT '종료일자',
  PRIMARY KEY (`sch_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_studyroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_studyroom` (
  `no` INT NOT NULL COMMENT '학번',
  `id` VARCHAR(200) NOT NULL,
  `name` VARCHAR(50) NULL COMMENT '신청자 이름',
  `dept` VARCHAR(50) NULL COMMENT '소속학과',
  `seat_no` INT NULL COMMENT '좌석번호',
  `date` DATE NULL COMMENT '예약날짜',
  `time` TIME NULL COMMENT '이용시간',
  `status` VARCHAR(20) NULL COMMENT '이용상태',
  `user_member_id` VARCHAR(200) NOT NULL,
  `user_member_no` INT NOT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NOT NULL,
  `user_member_user_member_parent_no` INT NOT NULL,
  `user_member_point_id` VARCHAR(200) NOT NULL,
  `user_member_point_no` INT NOT NULL,
  `user_member_apply_consult_cns_no` INT NOT NULL,
  `user_member_apply_consult_no` INT NOT NULL,
  `user_member_apply_studyroom_no1` INT NOT NULL,
  `user_member_apply_sleepout_no` INT NOT NULL,
  `user_member_apply_sleepout_date` DATE NOT NULL,
  `user_member_apply_resign_no` INT NOT NULL,
  `user_member_apply_resign_apply_date` DATE NOT NULL,
  PRIMARY KEY (`no`, `id`, `user_member_id`, `user_member_no`, `user_member_user_member_parent_id`, `user_member_user_member_parent_no`, `user_member_point_id`, `user_member_point_no`, `user_member_apply_consult_cns_no`, `user_member_apply_consult_no`, `user_member_apply_studyroom_no1`, `user_member_apply_sleepout_no`, `user_member_apply_sleepout_date`, `user_member_apply_resign_no`, `user_member_apply_resign_apply_date`),
  INDEX `fk_apply_studyroom_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC, `user_member_point_id` ASC, `user_member_point_no` ASC, `user_member_apply_consult_cns_no` ASC, `user_member_apply_consult_no` ASC, `user_member_apply_studyroom_no1` ASC, `user_member_apply_sleepout_no` ASC, `user_member_apply_sleepout_date` ASC, `user_member_apply_resign_no` ASC, `user_member_apply_resign_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_apply_studyroom_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no` , `user_member_point_id` , `user_member_point_no` , `user_member_apply_consult_cns_no` , `user_member_apply_consult_no` , `user_member_apply_studyroom_no1` , `user_member_apply_sleepout_no` , `user_member_apply_sleepout_date` , `user_member_apply_resign_no` , `user_member_apply_resign_apply_date`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no` , `point_id` , `point_no` , `apply_consult_cns_no` , `apply_consult_no` , `apply_studyroom_no1` , `apply_sleepout_no` , `apply_sleepout_date` , `apply_resign_no` , `apply_resign_apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_sleepout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_sleepout` (
  `no` INT NOT NULL COMMENT '학번',
  `date` DATE NOT NULL COMMENT '신청날짜',
  `slout_reason` VARCHAR(40) NULL COMMENT '신청사유',
  `user_member_id` VARCHAR(200) NOT NULL,
  `user_member_no` INT NOT NULL,
  `user_member_user_member_parent_id` VARCHAR(200) NOT NULL,
  `user_member_user_member_parent_no` INT NOT NULL,
  `user_member_point_id` VARCHAR(200) NOT NULL,
  `user_member_point_no` INT NOT NULL,
  `user_member_apply_consult_cns_no` INT NOT NULL,
  `user_member_apply_consult_no` INT NOT NULL,
  `user_member_apply_studyroom_no1` INT NOT NULL,
  `user_member_apply_sleepout_no` INT NOT NULL,
  `user_member_apply_sleepout_date` DATE NOT NULL,
  `user_member_apply_resign_no` INT NOT NULL,
  `user_member_apply_resign_apply_date` DATE NOT NULL,
  PRIMARY KEY (`no`, `date`, `user_member_id`, `user_member_no`, `user_member_user_member_parent_id`, `user_member_user_member_parent_no`, `user_member_point_id`, `user_member_point_no`, `user_member_apply_consult_cns_no`, `user_member_apply_consult_no`, `user_member_apply_studyroom_no1`, `user_member_apply_sleepout_no`, `user_member_apply_sleepout_date`, `user_member_apply_resign_no`, `user_member_apply_resign_apply_date`),
  INDEX `fk_apply_sleepout_user_member1_idx` (`user_member_id` ASC, `user_member_no` ASC, `user_member_user_member_parent_id` ASC, `user_member_user_member_parent_no` ASC, `user_member_point_id` ASC, `user_member_point_no` ASC, `user_member_apply_consult_cns_no` ASC, `user_member_apply_consult_no` ASC, `user_member_apply_studyroom_no1` ASC, `user_member_apply_sleepout_no` ASC, `user_member_apply_sleepout_date` ASC, `user_member_apply_resign_no` ASC, `user_member_apply_resign_apply_date` ASC) VISIBLE,
  CONSTRAINT `fk_apply_sleepout_user_member1`
    FOREIGN KEY (`user_member_id` , `user_member_no` , `user_member_user_member_parent_id` , `user_member_user_member_parent_no` , `user_member_point_id` , `user_member_point_no` , `user_member_apply_consult_cns_no` , `user_member_apply_consult_no` , `user_member_apply_studyroom_no1` , `user_member_apply_sleepout_no` , `user_member_apply_sleepout_date` , `user_member_apply_resign_no` , `user_member_apply_resign_apply_date`)
    REFERENCES `dormitory`.`user_member` (`id` , `no` , `user_member_parent_id` , `user_member_parent_no` , `point_id` , `point_no` , `apply_consult_cns_no` , `apply_consult_no` , `apply_studyroom_no1` , `apply_sleepout_no` , `apply_sleepout_date` , `apply_resign_no` , `apply_resign_apply_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO role(name) VALUES('ROLE_USER');
INSERT INTO role(name) VALUES('ROLE_USER_MEMBER');
INSERT INTO role(name) VALUES('ROLE_ADMIN');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
