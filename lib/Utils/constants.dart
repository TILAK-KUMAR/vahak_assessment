
class Constants{

  static String homeAppBarTitle ='Quiz Assignment';
  static List<String> catagories = ['Cow','Horse','Butterfly','Elephant'];
  static String select_topic = 'Select a topic!';
  static String write_your_points = 'Write your points here';
  static String save_btn_text = 'SAVE';
  static String butterfly_url = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  static String elephant_url = 'https://cdn.videvo.net/videvo_files/video/free/2019-11/small_watermarked/190301_1_25_03_preview.webm';
  static String cow_url = 'https://images.all-free-download.com/footage_preview/webm/cows_95.webm';
  static String horse_url = 'https://cdn.videvo.net/videvo_files/video/free/2019-06/small_watermarked/190416_13_MidlandsFarm_HD_007_preview.webm';
  static String elephant_desc = 'Elephants are the largest existing land animals. Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia and are found in different habitats, including savannahs, forests, deserts, and marshes. They are herbivorous, and they stay near water when it is accessible';
  static String cow_desc = 'Cattle, or cows and bulls, are large domesticated cloven-hooved herbivores. They are a prominent modern member of the subfamily Bovinae, are the most widespread species of the genus Bos, and are most commonly classified collectively as Bos taurus.';
  static String butterfly_desc = 'Butterflies are insects in the macrolepidopteran clade Rhopalocera from the order Lepidoptera, which also includes moths. Adult butterflies have large, often brightly coloured wings, and conspicuous, fluttering flight. ';
  static String horse_desc = 'The horse is a domesticated one-toed hoofed mammal. Horses are herbivores with a digestive system adapted to a forage diet of grasses and other plant material, consumed steadily throughout the day. Therefore, compared to humans, they have a relatively small stomach but very long intestines to facilitate a steady flow of nutrients. ';
  static String quiz_start_txt = 'Get ready for your first question';
  static String quiz_next_txt = 'Get ready for your next question';
  static String quiz_completed_txt = 'Completed Quiz successfully Please wait while we generate the Report.';
  static String wrong_answer = 'Wrong Answer';
  static String right_answer = 'Correct Answer';
  static String my_quiz = 'Oh My Quiz';
  static String question_number = 'Question ';
  static int correct_answers = 0;
  static int wrong_answers = 0;
  static int not_answered = 0;
  static int total_time_taken = 0;
  static String report_summary = 'Summary of your Report';
  static String max_marks = 'Maximum marks can be scored is 10';
  static List marks_details_list =[];
  static List marks_time_list =[];
  static List elephant_questions = [{'question':'Largest existing land animal is ','A':'Blue Whale','B':'Lion',
  'C':'Elephant','D':'Tiger','E':'Elephant'},
    {'question':'How many bones Elephants have','A':'326–351','B':'250-300',
      'C':'260-280','D':'300-350','E':'326–351'},
    {'question':'Elephant trunks have multiple functions, including breathing and __',
      'A':'Fighting','B':'Talking', 'C':'Smelling','D':'Touching','E':'Touching'},
    {'question':'How many teeths Elephants have? ','A':'2','B':'20',
      'C':'26','D':'27','E':'26'},
    {'question':'How many teeths Elephants have?','A':'2','B':'3',
      'C':'1','D':'0','E':'2'},
    {'question':'Elephant is ','A':'Wild Animal','B':'Pet Animal',
      'C':'A and B','D':'None of the above','E':'Wild Animal'},
    {'question':'Largest number of Elephants found in ','A':'India','B':'South Africa',
      'C':'Kenya','D':'Botswana','E':'Botswana'},
    {'question':'Which country has the most elephants in Asia?','A':'India','B':'SriLanka',
      'C':'China','D':'Russia','E':'India'},
    {'question':'Which country has the second largest elephant population?','A':'China','B':'India',
      'C':'Zimbabwe','D':'Kenya','E':'Zimbabwe'},
    {'question':'Which elephant is most endangered?','A':'Indian Elephants','B':'African Elephants',
      'C':'American Elephants','D':'None of the above','E':'African Elephants'}
  ];

  static List butterfly_questions = [{'question':'Butterflies are special than other insects because of ',
    'A':'Age','B':'Color', 'C':'Height','D':'None of the above','E':'Color'},
    {'question':'What is the rarest type of butterfly?','A':'Indian Butterfly','B':'Palos Verdes Black',
      'C':'Danaus plexippus','D':'Palos Verdes Blue','E':'Palos Verdes Blue'},
    {'question':'Which is the rarest butterfly in the world?',
      'A':'Palos Verdes Black','B':'Schaus swallowtail', 'C':'Palos Verdes Blue','D':'Danaus plexippus','E':'Schaus swallowtail'},
    {'question':'What was the original name of butterfly? ','A':'Butterfly','B':'insect papilio',
      'C':'catterpiller','D':'morpho','E':'insect papilio'},
    {'question':'What is the most popular butterfly?','A':'insect papilio','B':'Painted Lady butterfly',
      'C':'Schaus swallowtail','D':'Palos Verdes Blue','E':'Painted Lady butterfly'},
    {'question':'What is another word for butterfly?','A':'larva','B':'moth',
      'C':'A and B','D':'None of the above','E':'A and B'},
    {'question':'Life span of butterflies lies between __ days ','A':'18-20','B':'14-28',
      'C':'15-30','D':'10-20','E':'14-28'},
    {'question':'When a caterpillar turns into a butterfly what is it called?','A':'Cocoon','B':'insect papilio',
      'C':'Metamorphosis','D':'Chrysalis','E':'Metamorphosis'},
    {'question':'What is the lifespan of Painted lady?','A':'12 months','B':'6 months',
      'C':'3 months','D':'1 month','E':'12 months'},
    {'question':'Butterfiles are','A':'Insects','B':'birds',
      'C':'Virus','D':'None of the above','E':'Insects'}
  ];

  static List horse_questions = [
    {'question':'Horses can sleep standing up and lying down. True or false?',
      'A':'True','B':'False', 'C':'A and B','D':'None','E':'True'},

    {'question':'Colic is a problem for horses because…','A':'They cannot burp','B':'They cannot regurgitate',
      'C':'A and B','D':'None','E':'A and B'},

    {'question':'A well-cared-for horse can live…',
      'A':'10 years at most','B':'More than 30 years', 'C':'Around 15 years','D':'20 years at most','E':'More than 30 years'},

    {'question':'The most popular breed of horse is the…','A':' Arabian','B':'Quarter Horse',
      'C':'Thoroughbred','D':'None','E':'Quarter Horse'},

    {'question':'Behaviorally, horses most prefer to…','A':'Live in a group','B':'Live with a friend',
      'C':'A and B','D':'Go it alone','E':'Live in a group'},

    {'question':'The original horse was called… ','A':'Phorusrhacos','B':'Equisaurus',
      'C':'Eohippus','D':'None of the above','E':'Eohippus'},

    {'question':' Horses usually sleep… ','A':'Lying down','B':'Standing up',
      'C':'With one eye open','D':'With two eyes open','E':'Standing up'},

    {'question':'A newborn horse of either gender is called a…','A':'Pup','B':'Foal',
      'C':'Calf','D':'Cub','E':'Foal'},

    {'question':'Gray horses are usually born…','A':'Gray','B':'A darker color',
      'C':'Brown','D':'White','E':'A darker color'},

    {'question':'The mother of a horse is called its…','A':'Dam','B':'Mater',
      'C':'Mom','D':'None of the above','E':'Dam'}
  ];


  static List cow_questions = [
    {'question':'What is a female cow called?','A':'Female Cow','B':'Cow',
    'C':'Hifiers','D':'Heifer','E':'Heifer'},

    {'question':'How many teeths Cows have','A':'26','B':'28',
      'C':'32','D':'36','E':'32'},

    {'question':'What is the maximum age of cow?',
      'A':'20','B':'25', 'C':'30','D':'35','E':'25'},

    {'question':'Is cow colour blind ','A':'Yes','B':'No',
      'C':'May be','D':'Don\'t know','E':'Yes'},

    {'question':'How many compartments does a cow’s stomach have?','A':'2','B':'3',
      'C':'4','D':'5','E':'4'},

    {'question':'Cow is ','A':'Wild Animal','B':'Domastic Animal',
      'C':'A and B','D':'None of the above','E':'Domastic Animal'},

    {'question':'What is the average body temperature of a cow? ','A':'11.5°F','B':'111.5°F',
      'C':'110.5°F','D':'101.5°F','E':'101.5°F'},

    {'question':'What family do cows belong to?','A':'Bovidae','B':'Heifer',
      'C':'Holstein','D':'None of the above','E':'Bovidae'},

    {'question':'Can cows see in the dark?','A':'Yes','B':'No',
      'C':'May be','D':'Don\'t know','E':'Yes'},

    {'question':'What two body parts can determine the age of a cow?',
      'A':'Hooves and legs','B':'Tail and rump', 'C':'Teeth and horns','D':'None of the above',
      'E':'Teeth and horns'}
  ];
}