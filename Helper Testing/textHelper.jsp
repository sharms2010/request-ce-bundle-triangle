<%@page pageEncoding="UTF-8" contentType="text/plain" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<%@page import="com.kineticdata.bundles.*"%>
<% request.setAttribute("text", new TextHelper()); %>
<%----%>
contains(String,String): ${text.contains("abc","b")} - <%= Text.contains("abc","b") %>

<%--please not the difference between the helper class input and the static class input--%>
containsRegex(String,String): ${text.containsRegex("ab\\nde", "b?d")} - <%= Text.containsRegex("ab\nde", "b?d") %>
<%----%>
defaultIfBlank(String,String): ${text.defaultIfBlank("", "def")} - <%= Text.defaultIfBlank("", "def") %>
displaySize(long): ${text.displaySize(1)} - <%= Text.displaySize(1) %>
downcase(String): ${text.downcase("aBc")} - <%= Text.downcase("aBc") %>
downcase(String, Locale): ${text.downcase("aBc",Locale.FRENCH)} - <%= Text.downcase("aBc",Locale.FRENCH) %>
endsWith(String, String): ${text.endsWith("abc", "")} - <%= Text.endsWith("abc","") %>
equals(String, String): ${text.equals("abc", "abc")} - <%= Text.equals("abc", "abc") %>
equalsIgnoreCase(String, String): ${text.equalsIgnoreCase("abc", "ABC")} - <%= Text.equalsIgnoreCase("abc", "ABC") %>
escape(String, String): ${text.escape("'\"<>&")} - <%= Text.escape("'\"<>&") %>
escapeJs(String, String): ${text.escapeJs("'\"/")} - <%= Text.escapeJs("'\"/") %>
escapeUrlParameter(String, String): ${text.escapeUrlParameter("abc.-_~@:!$&'()*+,;= Ä\"")} - <%= Text.escapeUrlParameter("abc.-_~@:!$&'()*+,;= Ä\"") %>
escapeUrlSegment(String, String): ${text.escapeUrlSegment("abc.-_~@:!$&'()*+,;= Ä\"")} - <%= Text.escapeUrlSegment("abc.-_~@:!$&'()*+,;= Ä\"") %>
isAlpha(String, String): ${text.isAlpha("abc abc")} - <%= Text.isAlpha("abc abc") %>
isAlphaSpace(String, String): ${text.isAlphaSpace("abc abc")} - <%= Text.isAlphaSpace("abc abc") %>
isAlphanumeric(String, String): ${text.isAlphanumeric("abc abc")} - <%= Text.isAlphanumeric("abc abc") %>
isAlphanumericSpace(String, String): ${text.isAlphanumericSpace("abc abc")} - <%= Text.isAlphanumericSpace("abc abc") %>
isBlank(String, String): ${text.isBlank(null)} - <%= Text.isBlank(null) %>
isEmpty(String, String): ${text.isEmpty(null)} - <%= Text.isEmpty(null) %>
isInteger(String, String): ${text.isInteger("1")} - <%= Text.isInteger("1") %>
isNotAlpha(String, String): ${text.isNotAlpha("!abc")} - <%= Text.isNotAlpha("!abc") %>
isNotAlphaSpace(String, String): ${text.isNotAlphaSpace("abc abc")} - <%= Text.isNotAlphaSpace("abc abc") %>
isNotAlphanumeric(String, String): ${text.isNotAlphanumeric("abc abc")} - <%= Text.isNotAlphanumeric("abc abc") %>
isNotAlphanumericSpace(String, String): ${text.isNotAlphanumericSpace("abc abc")} - <%= Text.isNotAlphanumericSpace("abc abc") %>
isNotBlank(String, String): ${text.isNotBlank(null)} - <%= Text.isNotBlank(null) %>
isNotEmpty(String, String): ${text.isNotEmpty(null)} - <%= Text.isNotEmpty(null) %>
isNotInteger(String, String): ${text.isNotInteger("1")} - <%= Text.isNotInteger("1") %>
isNotNull(String, String): ${text.isNotNull(null)} - <%= Text.isNotNull(null) %>
isNull(String, String): ${text.isNull(null)} - <%= Text.isNull(null) %>

<%--please not the difference between the helper class input and the static class input--%>
join(Object[] objects): ${text.join(["a", "b", "c"])} - <%= Text.join(new Object[] {"a", "b", "c"}) %>
join(Object[] objects, String separator) : ${text.join(["a", "b", "c"], ", ")} - <%= Text.join(new Object[] {"a", "b", "c"}, ", ") %>
join(Object[] objects, String separator, String conjunction): ${text.join(["a", "b"], ", ", "and")} - <%= Text.join(new Object[] {"a", "b"}, ", ", "and") %>
<%----%>
join(Collection objects): ${text.join(Arrays.asList("a", "b", "c"))} - <%= Text.join(Arrays.asList("a", "b", "c")) %>
join(Collection objects, String separator): ${text.join(Arrays.asList("a", "b", "c"), ", ")} - <%= Text.join(Arrays.asList("a", "b", "c"), ", ") %>
join(Collection objects, String separator, String conjunction): ${text.join(Arrays.asList("a", "b"), ", ", "and")} - <%= Text.join(Arrays.asList("a", "b"), ", ", "and") %>

<%--please not the difference between the helper class input and the static class input--%>
join(Map objects, String entrySeparator, String separator): ${text.join({"a": "A", "b": "B"}, ":", ", ")} - <%= Text.join((Map)JsonUtils.parse("{\"a\": \"A\", \"b\": \"B\"}"), ":", ", ") %>
join(Map objects, String entrySeparator, String separator, String conjunction): ${text.join({"a": "A", "b": "B"}, ":", ",", "and")} - <%= Text.join((Map)JsonUtils.parse("{\"a\": \"A\", \"b\": \"B\"}"), ":", ",", "and") %>
<%----%>
length(String, String): ${text.length("abc")} - <%= Text.length("abc") %>
matchesRegex(String string, String regex): ${text.matchesRegex("abcdefg", "a.+g")} - <%= Text.matchesRegex("abcdefg", "a.+g") %>
padEnd(String string, int length, char paddingCharacter): ${text.padEnd(null, 5, '.')} - <%= Text.padEnd(null, 5, '.') %>
padStart(String string, int length, char paddingCharacter): ${text.padStart(null, 5, '.')} - <%= Text.padStart(null, 5, '.') %>
replace(String string, String substring, String replacement): ${text.replace("abcdef", "def", "xyz")} - <%= Text.replace("abcdef", "def", "xyz") %>
replaceRegex((String string, String substring, String replacement): ${text.replaceRegex("abcdef", "def", "xyz")} - <%= Text.replaceRegex("abcdef", "def", "xyz") %>
split(String string, String separator): ${text.split("a1b2c", "\\d")} - <%= Text.split("a1b2c", "\\d") %>
split(String string, String separator, int limit): ${text.split("a|b|c", "|", 2)} - <%= Text.split("a|b|c", "|", 2) %>
splitRegex(String string, String separator): ${text.splitRegex("a1b2c", "\\d")} - <%= Text.splitRegex("a1b2c", "\\d") %>
splitRegex(String string, String separator, int limit): ${text.splitRegex("a|b|c", "|", 2)} - <%= Text.splitRegex("a|b|c", "|", 2) %>
startsWith(String string, String substring): ${text.startsWith("abcdef", "")} - <%= Text.startsWith("abcdef", "") %>
substring(String string, int offset): ${text.substring("abcdef", -4)} - <%= Text.substring("abcdef", -4) %>
substring(String string, int offset, int length): ${text.substring("abcdef", 10, 2)} - <%= Text.substring("abcdef", 10, 2) %>
titlelize(String, String): ${text.titlelize("Pride And Prejudice")} - <%= Text.titlelize("Pride And Prejudice") %>
trim(String, String): ${text.trim("abc")} - <%= Text.trim("abc") %>
trim(String string, String defaultString): ${text.trim("abc", "def")} - <%= Text.trim("abc", "def") %>
truncate(String string, int length): ${text.truncate("123456789", 5)} - <%= Text.truncate("123456789", 5) %>
truncate(String string, int length, String suffix): ${text.truncate("123456789", 5, "...")} - <%= Text.truncate("123456789", 5, "...") %>
upcase(String string): ${text.upcase("aBc")} - <%= Text.upcase("aBc") %>
upcase(String string, Locale locale): ${text.upcase("aBc",Locale.FRENCH)} - <%= Text.upcase("aBc",Locale.FRENCH) %>
























































































































































































