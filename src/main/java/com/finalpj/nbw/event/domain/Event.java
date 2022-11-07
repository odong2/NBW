package com.finalpj.nbw.event.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@ToString
public class Event {
    private Integer ev_no; //
    private String ev_title; // 행사이름
    private String ev_content; // 행사설명(글)
    private Date ev_cdate; // 게시글 등록날짜
    private String ev_file; // 첨부파일
    private Integer ev_hit; // 조회수
    private String ev_start; // 행사 시작일
    private String ev_end; // 행사 종료일
    private Integer ev_people; // 모집 정원

    private String ev_status; // 상태(참여중/참여가능)

    private Integer ev_nowpeople; // 남은정원
    private String ev_target; // 이벤트 대상
    private String ev_time; // 이벤트 시간
    private String ev_place; // 이벤트 장소
    private String ev_img; // 행사 포스터
    private String ev_today; // 교육기간
    private String ev_phone; // 문의번호

    private Integer ev_cocnt; // 댓글카운트

    public Event (Integer ev_no, String ev_title, String ev_content, String ev_file,
                  String ev_start, String ev_end, Integer ev_people, String ev_target,
                  String ev_place, String ev_img, String ev_today, String ev_phone, String ev_time) {
        this.ev_no = ev_no;
        this.ev_title = ev_title;
        this.ev_content = ev_content;
        this.ev_file = ev_file;
        this.ev_start = ev_start;
        this.ev_end = ev_end;
        this.ev_people = ev_people;
        this.ev_target = ev_target;
        this.ev_place = ev_place;
        this.ev_img = ev_img;
        this.ev_today = ev_today;
        this.ev_phone = ev_phone;
        this.ev_time = ev_time;
    }


}
