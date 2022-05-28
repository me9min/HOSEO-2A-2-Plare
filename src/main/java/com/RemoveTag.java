package com;

public class RemoveTag {
	public String removeHtmlTag(String content) throws Exception {
		return content.replaceAll("(<.*?>)|(&.*?;)|([ ]{2,})", "");
	}
	public String removeJSInput(String content) throws Exception {
		return content.replaceAll("'", "&#39;");
	}
}