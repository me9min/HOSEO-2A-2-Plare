package com;

public class RemoveTag {
	public String removeHtmlTag(String content) throws Exception {
		return content.replaceAll("(<.*?>)|(&.*?;)|([ ]{2,})", "");
	}
}
