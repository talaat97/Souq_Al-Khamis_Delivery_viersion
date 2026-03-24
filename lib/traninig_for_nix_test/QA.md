1. the diffrent between final and const 
final : is setting value in runtime and cant change afterwards usege with api call datatime 
const : make the value cant change ever while setting value for it like Pi mathmatical factor 


2.the late keyword mean in flutter i will assigned value later in runtime for the value just egniour the nill of it it wil intiallised later 
    -so i use in tow use case delcore non nullable value that wiold intillaed later 
    - the lazy value intialization 


3.it is a consebt in the flutter language that save the code form crashing that constaitng of u to gave varibale to intializeing it insted of not value (null) that help code to be mre save and less errors and debbuged  
    ? : maen when usen with value that i know this value cant be 
    value or null
        the exapmle 
            String? name ;
            int? length = name?.length; 

            name = 'talaat'
            print($name); //null erorr 
 
    ! : mean for compiler that this value is never going to be null 
            String? name ;
            name = 'talaat'
            itn length = name!.length;
            print($name); //null erorr


4.statlessWidget : is immutalbe widgets that fixed with no chagen or interactive ui with user 
  statefullwiget : is widget that interactive with user by the state to gave user dynamic and gave more behavior according to response of user or data changes

5.build() method is one of widget lifecycle that in it the widget developer worte start to render in screen by gave it the widget (column - row - container) and get ofter the setstate() method if the is referch in UI and contain a value called context a key value for flutter in widget tree to tell flutter the specific location in tree 

6. the value will chaged in memory but not refreched or update in UI or render the change 

7.Expanded : tell the child widget to take all the remain place to expand in the layout
  flixable : tell the cild widget to take the just nedded space that it wont 

8.add new route to existing route and allow user to return to previous scrren by back button 
  replace the cuurent route with new one 

9 . a keword diefine the potentioal of to make value will be intialiedn at some point in future in flutter as there is asyncchronous operation in code 

10. async await : it is allows developer to write asynchronous code in a liner , which improve the readability 
    then() : used callback-based and tell compiler after this code will done the code in then 

11. using try/catch when i predact that the will error in this point of code so by wraping it and see the common error will show and save form code crash 

13. the reprosity pattern : is a pattern concept of adding layer bettween logic and contolller (data) ot make some operation like paggnation or cash for data  

14.unit test is the testing of isolatiing the business logic 
   widget test is the apperance and instraction of single UI component in simulated inviroment 

15. that i am passing a value that compliler wait value form it but it s null contaning nothing 



hot reload : keep and preseves application state and ,it fast, used for some limit chages not natiive changed  
hot restart : restart the applcaiton state , slow according to hot relaed , udate the all code 



to prevent unesasry rebuild ?
1-use const for const and fixed componat that not chage in UI
2-move the static components in statlesswidget or Statfulwidget
3-minimize the scope of  setstate() function just to necessary variable
4- used devTools to ispect witch widget rebauild alot and makeing load 



memory leak in flutter case by 
cashing refrence of objects that no longer needed 
like contller didnt dispose it 
or stream didnt close it with cancel() 
but some large image or lagrae data at wonce in memry to caching or pagination case load in memory

clean artticture ?
is a code design pattern make the code in layers with sepearted the logic , data , ui to make it eeasist for testing or scale and maintainalbe codebase 