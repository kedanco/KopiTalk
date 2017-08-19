#This is a practise project for Ruby
#KopiTalk is created to let people know what they are #ordering/how to phrase their desired coffee order in Singapore!


def initialize

	@milk = Hash.new
	@milk = {"o" => "No Milk", "si" => "Evaporated Milk", "c" => "Evaporated Milk"}

	@sugar = Hash.newa
	@sugar = {"siewdai" => "Less Sweet", "kosong" => "No Sugar", "gahdai" => "More Sweet"}

	@coffee = Hash.new
	@coffee = {"poh" => "Thinner", "gau" => "Thicker", "gao" => "Thicker", "dilo" => "Very Thick", "sua" => "Double Order"}

	@others = Hash.new
	@others = {"peng" => "Iced", "dabao" => "Takeaway","da bao" => "Take Away" "Phuasio" => "Half Hot"}

  p "initialization done!"
  
end


#option 1
def explainPhrase(str)

    arr = str.downcase.split(" ")
    (1..arr.length).each {|index|
    
    	arr[0] = "Coffee" if arr[0] == "kopi"
     
    	if @milk.include? arr[index]
    		arr[index] = @milk[arr[index]]
  		elsif @sugar.include? arr[index]	
  			arr[index] = @sugar[arr[index]]
  		end
  	}
  	
    arr.map!{|item| (@coffee.include?item) ? @coffee[item] : item}
    arr.map!{|item| (@others.include?item) ? @others[item] : item}
	
	  puts "#{str} means " + arr.join(",")

end

#option 2
def findPhrase(str)
  
  newStr = str.downcase
  newStr.gsub!("coffee", "kopi")
  
  @milk.map {|k,v| (newStr.include?v.downcase) ? newStr.gsub!(v.downcase, k) : newStr}
  @sugar.map {|k,v| (newStr.include?v.downcase) ? newStr.gsub!(v.downcase, k) : newStr}
  
  @coffee.map {|k,v| (newStr.include?v.downcase) ? newStr.gsub!(v.downcase, k) : newStr}
  @others.map {|k,v| (newStr.include?v.downcase) ? newStr.gsub!(v.downcase, k) : newStr}
  
  if str == newStr
    puts "Sorry, we didn't understand what you said."
  else
   puts "#{str} means " + newStr
  end
  
end

#option 3
def listPhrases

  p "Listing all phrases"
  p "----------------------"

end

def displayMenu

	p "Welcome to KopiTalks! "
	p  "Main Menu"
	p  "-------------------"
	p  "1. Meaning of a Kopi phrase (e.g. 'Kopi Siew Dai')"
	p  "2. Find out the KopiTalk for your desired coffee!"
	p  "3. List phrases"
	p  "4. About KopiTalk"
	p  "---------------------"
	p  "Choose an option! To exit, press anything else: "

	 return input = gets.chomp!

end

initialize()
option = displayMenu().to_i

while (1..4).include? (option)
	if option == 1
		p "Enter the phrase you wish to know more about, with spacing: "
		phrase = gets.chomp!
		explainPhrase(phrase)
	elsif option == 2
		p "Enter your desired order in english, with spacing: "
		phrase = gets.chomp!
		findPhrase(phrase)
	elsif option == 3
		listPhrases()
	elsif option == 4
		p "KopiTalk is created by Kelvin Chow (Kedanco)"
		p "This is a test project based on Ruby"
		p "View my profile on github.com/kedanco and provide feedback :)"
	end
		
		p "Press anything to continue..."
		temp = gets
		puts
    puts

  option = displayMenu().to_i
  
  puts
  puts
		
end

p "Thank you! See you again for some KopiTalk :)"	

