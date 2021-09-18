package com.spring.wefit.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE CourseReport
(
    cbNum    NUMBER(10, 0)    NOT NULL, 
    mNum    NUMBER(20, 0)    NOT NULL
);  
 */

@Getter
@Setter
@ToString
public class CourseReportVO {
	
	private int cbNum;
	private int mNum;

}
