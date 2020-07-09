package com.ncs.vo;


public class MergeDTO<T,E> {
	
	private T board;
	private E member;

	public MergeDTO(T board, E member) {
		this.board = board;
		this.member = member;
	}

	public T getBoard() {
		return board;
	}

	public void setBoard(T board) {
		this.board = board;
	}

	public E getMember() {
		return member;
	}

	public void setMember(E member) {
		this.member = member;
	}

}
