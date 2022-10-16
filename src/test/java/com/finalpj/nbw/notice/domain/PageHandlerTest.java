package com.finalpj.nbw.notice.domain;

import org.junit.Test;

import static org.junit.Assert.*;

public class PageHandlerTest {

    @Test
    public void pageHandlerTest1(){
        PageHandler ph = new PageHandler(100, 3);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage()==1);
        assertTrue(ph.getEndPage()==10);
    }
    @Test
    public void pageHandlerTest2(){
        PageHandler ph = new PageHandler(101, 15);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage()==11);
        assertTrue(ph.getEndPage()==11);
    }
}