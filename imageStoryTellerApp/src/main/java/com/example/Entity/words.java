package com.example.Entity;

import java.util.ArrayList;
import java.util.List;

import com.googlecode.objectify.annotation.Entity;

@Entity
public class words {
	
	public words() {
		
		 nouns = new ArrayList<String>();
		 verbs = new ArrayList<String>();
		 adverbs = new ArrayList<String>();
		 adjectives = new ArrayList<String>();
		
		setNouns();
		setAdjectives();
		setAdverb();
		setVerb();
	}
	
	private List<String> nouns;
	private List<String> verbs;
	private List<String> adverbs;
	private List<String> adjectives;
	
	public String getAdjective(int index){
		return adjectives.get(index);
	}
	
	public String getVerb(int index){
		return verbs.get(index);
	}
	
	public String getAdverb(int index){
		return adverbs.get(index);
	}
	
	public String getNoun(int index){
		return nouns.get(index);
	}
	
	private void setAdjectives() {
		adjectives.add("good");
		adjectives.add("new");
		adjectives.add("first");
		adjectives.add("last");
		adjectives.add("long");
		adjectives.add("great");
		adjectives.add("little");
		adjectives.add("own");
		adjectives.add("other");
		adjectives.add("old");
		adjectives.add("right");
		adjectives.add("big");
		adjectives.add("high");
		adjectives.add("different");
		adjectives.add("small");
		adjectives.add("large");
		adjectives.add("next");
		adjectives.add("early");
		adjectives.add("young");
		adjectives.add("important");
		adjectives.add("few");
		adjectives.add("public");
		adjectives.add("bad");
		adjectives.add("same");
		adjectives.add("able");
	}
	
	private void setAdverb() {
		adverbs.add("up");
		adverbs.add("so");
		adverbs.add("out");
		adverbs.add("just");
		adverbs.add("now");
		adverbs.add("how");
		adverbs.add("then");
		adverbs.add("more");
		adverbs.add("also");
		adverbs.add("here");
		adverbs.add("well");
		adverbs.add("only");
		adverbs.add("very");
		adverbs.add("even");
		adverbs.add("back");
		adverbs.add("there");
		adverbs.add("down");
		adverbs.add("still");
		adverbs.add("in");
		adverbs.add("as");
		adverbs.add("too");
		adverbs.add("when");
		adverbs.add("never");
		adverbs.add("really");
		adverbs.add("most");
	}
	
	private void setVerb() {
		verbs.add("be");
		verbs.add("have");
		verbs.add("do");
		verbs.add("say");
		verbs.add("get");
		verbs.add("make");
		verbs.add("go");
		verbs.add("know");
		verbs.add("take");
		verbs.add("see");
		verbs.add("come");
		verbs.add("think");
		verbs.add("look");
		verbs.add("want");
		verbs.add("give");
		verbs.add("use");
		verbs.add("find");
		verbs.add("tell");
		verbs.add("ask");
		verbs.add("work");
		verbs.add("seem");
		verbs.add("feel");
		verbs.add("try");
		verbs.add("leave");
		verbs.add("call");
		verbs.add("is");
		verbs.add("are");
	}
	
	private void setNouns() {
		nouns.add("Afternoon");
		nouns.add("Greece");
		nouns.add("Pencil");
		nouns.add("Airport");
		nouns.add("Guitar");
		nouns.add("Piano");
		nouns.add("Ambulance");
		nouns.add("Hair");
		nouns.add("Pillow");
		nouns.add("Animal");
		nouns.add("Hamburger");
		nouns.add("Pizza");
		nouns.add("Answer");
		nouns.add("Helicopter");
		nouns.add("Planet");
		nouns.add("Apple");
		nouns.add("Helmet");
		nouns.add("Plastic");
		nouns.add("Army");
		nouns.add("Holiday");
		nouns.add("Portugal");
		nouns.add("Australia");
		nouns.add("Honey");
		nouns.add("Potato");
		nouns.add("Balloon");
		nouns.add("Horse");
		nouns.add("Queen");
		nouns.add("Banana");
		nouns.add("Hospital");
		nouns.add("Quill");
		nouns.add("Battery");
		nouns.add("House");
		nouns.add("Rain");
		nouns.add("Beach");
		nouns.add("Hydrogen");
		nouns.add("Rainbow");
		nouns.add("Beard");
		nouns.add("Ice");
		nouns.add("Raincoat");
		nouns.add("Bed");
		nouns.add("Insect");
		nouns.add("Refrigerator");
		nouns.add("Belgium");
		nouns.add("Insurance");
		nouns.add("Restaurant");

	}

}
