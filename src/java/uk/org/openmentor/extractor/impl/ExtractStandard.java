package uk.org.openmentor.extractor.impl;

import uk.org.openmentor.extractor.Extractor;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.poi.hwpf.extractor.WordExtractor;

public class ExtractStandard implements Extractor {
	
	
	private WordExtractor extractor;
	private Set<String> comments = new HashSet<String>();
	private String body;
	
    /*
     * Annotations in a few cases may contain fields. Actually, so may all the
     * text, which is irritating. So we need a way of skipping out all the
     * field stuff, and for this, regular expressions are a good solution.
     * Essentially, we should look for ASCII 19, which starts a field, and
     * ASCII 21, which ends the field. Delete these, and all other text, except
     * stuff which follows ASCII 20, which is the text view.
     */
    private static Log log = LogFactory.getLog(ExtractStandard.class);

    public ExtractStandard() {
    	
    }

    /**
     * Constructs a Word document from the input. Parses the document and places
     * all the important stuff into data structures.
     *
     * @param stream The stream representing the original file
     * @throws IOException if there is a problem while parsing the document.
     */
    public synchronized void extract(InputStream stream) throws IOException {
        extractStream(stream);
    }
    
    /*
     * Most of this code is broken - in a complex file, you can't assume that
     * the file offset can be calculated in this way. Instead, we should not use
     * fcMin, but use the piece table to calculate the offsetting. This is best
     * done once and cached.
     */

    private void extractStream(InputStream inputStream) throws IOException {
    	extractor = new WordExtractor(inputStream);
    	inputStream.close();
    	
    	String[] commentsArray = extractor.getCommentsText();
    	List<String> commentList = Arrays.asList(commentsArray);

    	comments.clear();
    	for(String comment : commentList) {
    		comments.add(stripFields(comment));
    	}    	
    	body = extractor.getText();
    }
    
    /*
     * Annotations in a few cases may contain fields. Actually, so may all the
     * text, which is irritating. So we need a way of skipping out all the
     * field stuff, and for this, regular expressions are a good solution.
     * Essentially, we should look for ASCII 19, which starts a field, and
     * ASCII 21, which ends the field. Delete these, and all other text, except
     * stuff which follows ASCII 20, which is the text view.
     */
    private static Pattern fieldPattern = Pattern.compile("\\x13[^\\x14\\x15]*(?:\\x14([^\\x15]*))?\\x15");
    
    private static Pattern cleanPattern = Pattern.compile("\\x0b");
    
    /*
     * TODO Make this handle nested fields, which can occur according to POI documentation 
     */
    private static String stripFields(String text) {
        /*
         * Amended to remove all field information - even the visible text. This
         * is a bad idea in one sense - strictly it is invalid, as we are not
         * really correct about annotation boundaries. But in another sense,
         * fields are not written by people, so we can probably ignore them
         * validly anyway.
         */
        String result = fieldPattern.matcher(text).replaceAll("");
        result = cleanPattern.matcher(result).replaceAll("");
        if (log.isTraceEnabled()) {
            log.trace("Removed field: " + result);
        }
        return result;
    }

    public String getBody() {
        return body;
    }

    public Set getAnnotations() {
    	return comments;
    }
}