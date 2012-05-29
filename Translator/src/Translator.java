import java.io.*; 
import java.util.*;



public class Translator {

	static final String ZERO = "0000";
	static final String INPUTFILE = "input.txt";
	static final String OUTPUTFILE = "output.txt";
	
	LinkedList<String> output = new LinkedList<String>();
	
	
	public static void main(String args[]) throws Exception { 
	
	LinkedList<String> input = readInput(INPUTFILE);
	
	LinkedList<String> encoded = encodeAll(input);
	
	LinkedList<String> formatted = format(input, encoded);
	
	writeOutput(formatted, OUTPUTFILE);

}
	
private static LinkedList<java.lang.String> format(LinkedList<String> original, LinkedList<java.lang.String> encoded) {
		LinkedList<String> output = new LinkedList<String>();
		
		for( int i=0; i< encoded.size(); i++) {
			output.add("var_insn_mem("+i+") := \""+encoded.get(i)+"\";   --"+original.get(i));
		}
		return output;
	}

private static LinkedList<String> readInput(String fileName) throws Exception{
		LinkedList<String> extracted = new LinkedList<String>();
		FileReader f = new FileReader(fileName); 
		BufferedReader br = new BufferedReader(f); 
		String s; 
		while((s = br.readLine()) != null) { 
		extracted.add(s);
		} 
		f.close(); 
		return extracted;
} 


private static LinkedList<String> encodeAll(LinkedList<String> input) throws Exception {
	
	LinkedList<String> res = new LinkedList<String>();
	
	for( int i=0; i<input.size(); i++) {
		if(! input.get(i).startsWith("-")) {
		res.add(encode(input.get(i)));
		}
	}
	
	return res;
	
}

private static String encode (String s) throws Exception {
	//construct tokenizer and split input on spaces
	String input = clean(s);
	StringTokenizer st = new StringTokenizer(input.toUpperCase());
    LinkedList<String> sl = new LinkedList<String>(); 
    String rs, rt, rdo;
    
    while (st.hasMoreTokens()) {
    sl.add(st.nextToken());	
    }
    
    
    String opcode = sl.get(0);
    
    if(opcode.equals("NOP")) {
    	rs = ZERO;
    	rt = ZERO;
    	rdo = "0"+ZERO;
    }
    
    //might need to change this to suit expanded format
    else if(opcode.equals("STORE") || opcode.equals("LOAD")) {
    	rs = getRegCode(sl.get(2));
    	rt = getRegCode(sl.get(1));
    	rdo = "0"+ZERO;
    }
    
    else if(opcode.equals("BNE")) {
    	rs = getRegCode(sl.get(1));
    	rt = getRegCode(sl.get(2));	
		rdo = getBinary(sl.get(3));
    }
    
    else if(opcode.equals("ADDI")) {
    	rs = getRegCode(sl.get(2));
    	rt = getRegCode(sl.get(1));
		rdo = getBinary(sl.get(3));
    }
    
    
    else {
    	rdo = "0"+getRegCode(sl.get(1));
    	rs = getRegCode(sl.get(2));
    	rt = getRegCode(sl.get(3));
    }
    
	return getOpcode(opcode)+rs+rt+rdo;
	
}

private static String getBinary(String s) {
	int dec = Integer.parseInt(s);
	String bin = Integer.toBinaryString(dec);
	
	while( bin.length() < 5) {
		bin = "0"+ bin;
	}
	
	return bin;
}

private static String getRegCode(String s)  {
	
	if(s.equals ("R0")) return "0000";
		  	
	if(s.equals ( "I")) return "0001";
		    
	if(s.equals ( "J")) return "0010";
		   
	if(s.equals ("K")) return "0011";
		    
	if(s.equals ( "KN")) return "0100";
		    
	if(s.equals ( "IN")) return "0101";
		    
	if(s.equals ( "N")) return "0110";
		    
	if(s.equals ( "MEMA")) return "0111";
		    
	if(s.equals ( "MEMB")) return "1000";
		    
	if(s.equals ( "MEMC")) return "1001";
		    
	if(s.equals ("INDEXA")) return "1010";
		    
	if(s.equals ( "INDEXB")) return "1011";
		    
	if(s.equals ("INDEXC")) return "1100";
		    
	if(s.equals ( "TEMP1")) return "1101";
		    
	if(s.equals ( "TEMP2")) return  "1110";
		    
	if(s.equals ( "TEMP3")) return "1111";
		     
	System.out.println("ERROR couldn't match this to register: "+s);
	return null;  
	
}

private static String  getOpcode(String s) throws Exception {
	
	if( s.equals("NOP")) return "000";

	if(s.equals ("ADD"))  return "010";
	    
	if(s.equals ("SUB")) return "110";
		  
	if(s.equals ("ADDI")) return "101";  
		  
	if(s.equals ("BNE")) return "100";
	
	if(s.equals ("STORE")) return "011";
		  
	if(s.equals ("LOAD")) return "001";
	
	System.out.println("ERROR couldn't match this to opcode: "+s);  
	  return null;
}

private static String clean(String s) {
	String ret = s;
	ret = ret.replaceAll(",", "");
	ret = ret.replaceAll(";", "");
	
	return ret;
}
 


private static void writeOutput (LinkedList<String> data, String fileName) throws Exception{

FileWriter f = new FileWriter(fileName); 
for (int i=0; i < data.size(); i ++) { 
f.write(data.get(i)+'\n'); 
} 
f.close(); 
}
		
}	

