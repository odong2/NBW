package com.finalpj.nbw.domain;

import com.finalpj.nbw.notice.domain.PageHandler;
import org.junit.Test;

import static org.junit.Assert.*;

public class PageHandlerTest {

    @Test
    public void pageHandlerTest1(){
        PageHandler ph = new PageHandler(100, 3);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage()==1);
        assertTrue(ph.getEndPage()==5);
    }
    @Test
    public void pageHandlerTest2(){
        PageHandler ph = new PageHandler(101, 11);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage()==11);
        assertTrue(ph.getEndPage()==11);
    }
    @Test
    public void pageHandlerTest3(){
        PageHandler ph = new PageHandler(135, 13);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage()==11);
        assertTrue(ph.getEndPage()==14);
    }
}