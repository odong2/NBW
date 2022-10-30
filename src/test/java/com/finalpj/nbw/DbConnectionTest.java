package com.finalpj.nbw;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import lombok.extern.log4j.Log4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.sql.DataSource;
import java.sql.Connection;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                                 "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class DbConnectionTest {
        @Autowired
        DataSource ds;

        @Before
        public void setUp() throws Exception {
            log.info("------------테스트 시작--------------");
        }

        @After
        public void tearDown() throws Exception {
            log.info("------------테스트 종료--------------");
        }
        @Test
        public void dbConnectionTest() throws Exception {
            Connection conn = ds.getConnection();

           log.info("연결된 Connection = " + conn);

            assertTrue(conn!=null);
        }

}
