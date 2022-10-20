package com.finalpj.nbw.event.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
    Integer ev_no;
    String ev_title;
    String ev_content;
    Date ev_cdate;
    String ev_file;
    Integer ev_hit;
    String ev_start;
    String ev_end;
    Integer ev_people;
    String ev_status;
    Integer ev_nowpeople;
    String ev_target;
    String ev_place;
    String ev_img;
    String ev_today;
    String ev_phone;


}
