package com;

public class RemoveTag {
	public String removeHtmlTag(String content) throws Exception {
		return content.replaceAll("(<.*?>)|(&.*?;)|([ ]{2,})", "");
	}
	public String removeTagInMain(String content) throws Exception {
		return content.replaceAll("/(<([^>]+)>)/ig", "");
	}
}