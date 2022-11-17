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
-- Table `dormitory`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`point` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reason` VARCHAR(40) NULL COMMENT '상/벌점 사유',
  `date_receive` DATE NULL COMMENT '입력날짜',
  `date` DATETIME NULL COMMENT '처리날짜',
  `plusPoint` INT NULL COMMENT '상점',
  `minusPoint` INT NULL COMMENT '벌점',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`user_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`user_member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `english_name` VARCHAR(50) COMMENT '영문이름',
  `chinese_name` VARCHAR(10) COMMENT '한자이름',
  `grade` INT NULL COMMENT '학년',
  `gender` VARCHAR(1) NULL COMMENT '성별',
  `nationality` VARCHAR(50) NULL COMMENT '국적',
  `department` VARCHAR(50) NULL COMMENT '대학',
  `major` VARCHAR(50) NULL COMMENT '학과',
  `student_status` VARCHAR(20) NULL COMMENT '학적상태',
  `address` VARCHAR(200) NULL COMMENT '주소',
  `phone` VARCHAR(20) NULL COMMENT '연락처',
  `guardian_name` VARCHAR(50) COMMENT '보호자 성명',
  `guardian_relation` VARCHAR(15) COMMENT '보호자 관계',
  `guardian_phone` VARCHAR(20) COMMENT '보호자 연락처',
  `landline` VARCHAR(20) COMMENT '자택 전화',
  `plusPoint` INT NULL COMMENT '상점',
  `minusPoint` INT NULL COMMENT '벌점',
  `res_fac` INT NULL COMMENT '거주관',
  `res_room` INT NULL COMMENT '거주호실',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_join` (
  `id` INT NOT NULL COMMENT '아이디',
  `english_name` VARCHAR(50) COMMENT '영문',
  `chinese_name` VARCHAR(10) COMMENT '한자',
  `grade` INT NULL COMMENT '학년',
  `gender` VARCHAR(1) COMMENT '성별',
  `nationality` VARCHAR(20) COMMENT '국적',
  `department` VARCHAR(50) COMMENT '대학',
  `major` VARCHAR(50) COMMENT '학과',
  `student_status` VARCHAR(10) COMMENT '학적상태',
  `phone` VARCHAR(20) COMMENT '연락처',
  `address` VARCHAR(100) COMMENT '주소',
  `guardian_name` VARCHAR(50) COMMENT '보호자 성명',
  `guardian_relation` VARCHAR(15) COMMENT '보호자 관계',
  `guardian_phone` VARCHAR(20) COMMENT '보호자 연락처',
  `landline` VARCHAR(20) COMMENT '자택 전화',
  `date` DATETIME,
  `hope_fac_1` INT NULL COMMENT '희망시설1',
  `hope_fac_2` INT NULL COMMENT '희망시설2',
  `hope_fac_3` INT NULL COMMENT '희망시설3',
  `hope_fac_4` INT NULL COMMENT '희망시설4',
  `hope_fac_5` INT NULL COMMENT '희망시설5',
  `hope_fac_6` INT NULL COMMENT '희망시설6',
  `period` VARCHAR(15) NULL COMMENT '사용기간',
  `date_join` DATE NULL COMMENT '입사 날짜',
  `single_yn` BOOLEAN NULL COMMENT '1인실 사용신청',
  `pri_ent` BOOLEAN NULL COMMENT '우선입사 대상자',
  `fgn_mate` BOOLEAN NULL COMMENT '외국인 룸메이트',
  `accpm_ent` VARCHAR(50) NULL COMMENT '동반 입실자',
  `par_mes_yn` BOOLEAN NULL COMMENT '보호자 문자 수신사항',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_resign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_resign` (
  `id` INT NOT NULL COMMENT '아이디',
  `date` DATETIME,
  `res_date` DATE NULL COMMENT '퇴사 예정일',
  `res_reason` VARCHAR(200) NULL COMMENT '퇴사 사유',
  `approved` BOOLEAN COMMENT '승인 여부',
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dormitory`.`apply_sleepout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_sleepout` (
  `id` INT NOT NULL COMMENT '아이디',
  `date` DATETIME COMMENT '',
  `date_sleepout` DATE NULL COMMENT '신청 날짜',
  `reason` VARCHAR(200) NULL COMMENT '신청 사유',
  `approved` BOOLEAN COMMENT '승인 여부',
  PRIMARY KEY(`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_consult`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_consult` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `day_of_week` VARCHAR(3) COMMENT '',
  `timeslot1_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot2_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot3_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot4_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot5_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot6_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot7_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot8_okay` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `topic` VARCHAR(20) NULL COMMENT '',
  `subject` VARCHAR(100) NULL COMMENT '',
  `date` DATETIME COMMENT '',
  PRIMARY KEY(`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`studyroom_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_studyroom_schedule` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `seat` INT NOT NULL COMMENT '',
  `timeslot1_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot2_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot3_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot4_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot5_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot6_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  `timeslot7_taken` BOOLEAN NOT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY(`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dormitory`.`apply_studyroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`apply_studyroom` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `seat` INT NOT NULL COMMENT '',
  `timeslot1` INT NULL COMMENT '',
  `timeslot2` INT NULL COMMENT '',
  `timeslot3` INT NULL COMMENT '',
  `date` DATETIME COMMENT '',
  PRIMARY KEY(`id`))
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
  PRIMARY KEY (`id`, `studentno`))
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
-- Table `dormitory`.`board_repair`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_repair` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '아이디',
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
-- Table `dormitory`.`board_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_store` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '아이디',
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
-- Table `dormitory`.`board_lost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory`.`board_lost` (
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

INSERT INTO role(name) VALUES('ROLE_USER');
INSERT INTO role(name) VALUES('ROLE_USER_MEMBER');
INSERT INTO role(name) VALUES('ROLE_ADMIN');

INSERT INTO apply_studyroom_schedule(seat) VALUES(1);
INSERT INTO apply_studyroom_schedule(seat) VALUES(2);
INSERT INTO apply_studyroom_schedule(seat) VALUES(3);
INSERT INTO apply_studyroom_schedule(seat) VALUES(4);
INSERT INTO apply_studyroom_schedule(seat) VALUES(5);
INSERT INTO apply_studyroom_schedule(seat) VALUES(6);
INSERT INTO apply_studyroom_schedule(seat) VALUES(7);
INSERT INTO apply_studyroom_schedule(seat) VALUES(8);
INSERT INTO apply_studyroom_schedule(seat) VALUES(9);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
