package com.ezen.myweb.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class BoardDTO {
	private BoardVO bvo;
	private List<BFileVO> bfList;
}
