package com.finalpj.nbw.event.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
//@AllArgsConstructor
public class EventMember {
    private Integer ev_no;
    private String mem_id;
    private String mem_name;
    private String mem_gender;
    private String mem_birthday;
    private String mem_phone;

    public EventMember (Integer ev_no, String mem_id, String mem_name,
                        String mem_gender, String mem_birthday, String mem_phone
                        ) {
        this.ev_no = ev_no;
        this.mem_id = mem_id;
        this.mem_name = mem_name;
        this.mem_gender = mem_gender;
        this.mem_birthday = mem_birthday;
        this.mem_phone = mem_phone;
    }

}
