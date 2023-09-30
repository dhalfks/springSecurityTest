package com.ezen.myweb.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentVO {
	private long cno;
	private long pno;
	private String writer;
	private String content;
	private String regAt;
	private String modAt;
}
