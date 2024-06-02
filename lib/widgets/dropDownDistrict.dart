import 'package:flutter/material.dart';

class DropDownDistrict extends StatefulWidget {
  final String? state;
  final ValueChanged<String?> selectedDistrict;

  const DropDownDistrict(
      {Key? key, required this.state, required this.selectedDistrict})
      : super(key: key);

  @override
  _DropDownDistrictState createState() => _DropDownDistrictState();
}

class _DropDownDistrictState extends State<DropDownDistrict> {
  String? _selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedDistrict,
      style: TextStyle(color: Colors.white), // Set text color to white
      dropdownColor: Colors.transparent,
      items: _getDistrictsForState(),
      onChanged: (newValue) {
        setState(() {
          _selectedDistrict = newValue;
          widget.selectedDistrict(newValue);
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _getDistrictsForState() {
    switch (widget.state) {
      case 'ANDAMAN AND NICOBAR ISLANDS':
        return _getDistrictItems(ANDAMAN_AND_NICOBAR_ISLANDS);
      case 'ANDHRA PRADESH':
        return _getDistrictItems(ANDHRA_PRADESH);
      case 'ARUNACHAL PRADESH':
        return _getDistrictItems(ARUNACHAL_PRADESH);
      case 'ASSAM':
        return _getDistrictItems(ASSAM);
      case 'BIHAR':
        return _getDistrictItems(BIHAR);
      case 'CHANDIGARH':
        return _getDistrictItems(CHANDIGARH);
      case 'CHHATTISGARH':
        return _getDistrictItems(CHHATTISGARH);
      case 'DADRA AND NAGAR HAVELI':
        return _getDistrictItems(DADRA_AND_NAGAR_HAVELI);
      case 'DAMAN AND DIU':
        return _getDistrictItems(DAMAN_AND_DIU);
      case 'GOA':
        return _getDistrictItems(GOA);
      case 'GUJARAT':
        return _getDistrictItems(GUJARAT);
      case 'HARYANA':
        return _getDistrictItems(HARYANA);
      case 'HIMACHAL PRADESH':
        return _getDistrictItems(HIMACHAL_PRADESH);
      case 'JAMMU AND KASHMIR':
        return _getDistrictItems(JAMMU_AND_KASHMIR);
      case 'JHARKHAND':
        return _getDistrictItems(JHARKHAND);
      case 'KARNATAKA':
        return _getDistrictItems(KARNATAKA);
      case 'KERALA':
        return _getDistrictItems(KERALA);
      case 'LADAKH':
        return _getDistrictItems(LADAKH);
      case 'LAKSHADWEEP':
        return _getDistrictItems(LAKSHADWEEP);
      case 'MADHYA PRADESH':
        return _getDistrictItems(MADHYA_PRADESH);
      case 'MAHARASHTRA':
        return _getDistrictItems(MAHARASHTRA);
      case 'MANIPUR':
        return _getDistrictItems(MANIPUR);
      case 'MEGHALAYA':
        return _getDistrictItems(MEGHALAYA);
      case 'MIZORAM':
        return _getDistrictItems(MIZORAM);
      case 'NAGALAND':
        return _getDistrictItems(NAGALAND);
      case 'NCT OF DELHI':
        return _getDistrictItems(NCT_OF_DELHI);
      case 'ODISHA':
        return _getDistrictItems(ODISHA);
      case 'PSU':
        return _getDistrictItems(PSU);
      case 'PUDUCHERRY':
        return _getDistrictItems(PUDUCHERRY);
      case 'PUNJAB':
        return _getDistrictItems(PUNJAB);
      case 'RAJASTHAN':
        return _getDistrictItems(RAJASTHAN);
      case 'SIKKIM':
        return _getDistrictItems(SIKKIM);
      case 'TAMIL NADU':
        return _getDistrictItems(TAMIL_NADU);
      case 'TELANGANA':
        return _getDistrictItems(TELANGANA);
      case 'TRIPURA':
        return _getDistrictItems(TRIPURA);
      case 'UTTARAKHAND':
        return _getDistrictItems(UTTARAKHAND);
      case 'UTTAR PRADESH':
        return _getDistrictItems(UTTAR_PRADESH);
      case 'WEST BENGAL':
        return _getDistrictItems(WEST_BENGAL);
      default:
        return <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'UNKNOWN',
            child: Text('Unknown District'),
          ),
        ];
    }
  }

  List<DropdownMenuItem<String>> _getDistrictItems(List<String> districts) {
    return districts.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value,style: TextStyle(color: Colors.white),),
      );
    }).toList();
  }

  // Define districts for each state
  static const List<String> ANDAMAN_AND_NICOBAR_ISLANDS = [
    "NICOBAR",
    "NORTH AND MIDDLE ANDAMAN",
    "SOUTH ANDAMAN"
  ];

  static const List<String> ANDHRA_PRADESH = [
    "Uknown",
    "ANANTHPUR",
    "CHITTOOR",
    "CUDDAPAH",
    "EAST GODAVARI",
    "GUNTUR",
    "KRISHNA",
    "KURNOOL",
    "NELLOR",
    "PRAKASAM",
    "SRIKAKULAM",
    "VISHAKHAPATNAM",
    "VIZIANAGARAM",
    "WEST GODAVARI"
  ];

  static const List<String> ARUNACHAL_PRADESH = [
    "ANJAW",
    "CHANGLANG",
    "EAST KAMENG",
    "EAST SIANG",
    "KAMLE",
    "KURUNG KUMEY",
    "Kra Daadi",
    "LEPARADA",
    "LOHIT",
    "LONGDING",
    "LOWER DIBANG VALLEY",
    "LOWER SIANG",
    "LOWER SUBANSIRI",
    "NAMSAI",
    "PAKKE KESSANG",
    "PAPUM PARE",
    "SHI YOMI",
    "SIANG",
    "TAWANG",
    "TIRAP",
    "UPPER SIANG",
    "UPPER SUBANSIRI",
    "WEST SIANG",
    "WEST" "KAMENG"
  ];

  static const List<String> ASSAM = [
    "Uknown",
    "BAKSA",
    "BARPETA",
    "BONGAIGAON",
    "Biswanath",
    "CHIRANG",
    "Cachar",
    "DARRANG",
    "DHEMAJI",
    "DHUBRI",
    "DIBRUGARH",
    "GOALPARA",
    "GOLAGHAT",
    "HAILAKANDI",
    "HOJAI",
    "JORHAT",
    "KAMRUP METRO",
    "KAMRUP",
    "KARBI ANGLONG",
    "KARIMGANJ",
    "KOKRAJHAR",
    "LAKHIMPUR",
    "MAJULI",
    "MARIGAON",
    "NAGAON",
    "NALBARI",
    "NORTH CACHAR HILL",
    "SIBSAGAR",
    "SONITPUR",
    "SOUTH SALMARA MANCACHAR",
    "TINSUKIA",
    "UDALGURI",
    "WEST KARBI ANGLONG"
  ];

  static const List<String> BIHAR = [
    "ARARIA",
    "ARWAL",
    "AURANGABAD",
    "BANKA",
    "BEGUSARAI",
    "BHAGALPUR",
    "BHOJPUR",
    "BUXAR",
    "DARBHANGA",
    "EAST CHAMPARAN",
    "GAYA",
    "GOPALGANJ",
    "JAMUI",
    "JEHANABAD",
    "KAIMUR (BHABUA)",
    "KATIHAR",
    "KHAGARIA",
    "KISHANGANJ",
    "LAKHISARAI",
    "MADHEPURA",
    "MADHUBANI",
    "MUNGER",
    "MUZAFFARPUR",
    "NALANDA",
    "NAWADA",
    "PATNA",
    "PURNIA",
    "ROHTAS",
    "SAHARSA",
    "SAMASTIPUR",
    "SARAN",
    "SHEIKHPURA",
    "SHEOHAR",
    "SITAMARHI",
    "SIWAN",
    "SUPAUL",
    "VAISHALI",
    "WEST CHAMPARAN"
  ];

  static const List<String> CHANDIGARH = ["CHANDIGARH"];

  static const List<String> CHHATTISGARH = [
    "BALOD",
    "BALODA BAZAR",
    "BALRAMPUR",
    "BASTAR",
    "BEMETARA",
    "BILASPUR",
    "Bijapur(CGH)",
    "DANTEWADA",
    "DHAMTARI",
    "DURG",
    "GARIABAND",
    "GAURELLA PENDRA MARWAHI",
    "JANJGIR-CHAMPA",
    "JASHPUR",
    "KABIRDHAM",
    "KANKER",
    "KONDAGAON",
    "KORBA",
    "KORIYA",
    "MAHASAMUND",
    "MUNGELI",
    "NARAYANPUR",
    "RAIGARH",
    "RAIPUR",
    "RAJNANDGAON",
    "SUKMA",
    "SURAJPUR",
    "SURGUJA"
  ];

  static const List<String> DADRA_AND_NAGAR_HAVELI = ["DADRA & NAGAR HAVELI"];

  static const List<String> DAMAN_AND_DIU = ["DAMAN", "DIU"];

  static const List<String> GOA = ["NORTH GOA", "SOUTH GOA"];

  static const List<String> GUJARAT = [
    "AHMEDABAD",
    "AMRELI",
    "ANAND",
    "ARVALLI",
    "BHARUCH",
    "BHAVNAGAR",
    "BOTAD",
    "Banaskantha",
    "CHHOTAUDEPUR",
    "DANG",
    "DEVBHUMI DWARKA",
    "Dahod",
    "GIR SOMNATH",
    "Gandhi Nagar",
    "JAMNAGAR",
    "JUNAGADH",
    "KACHCHH",
    "KHEDA",
    "MAHESANA",
    "MORBI",
    "Mahisagar",
    "NARMADA",
    "NAVSARI",
    "PANCH MAHALS",
    "PATAN",
    "PORBANDAR",
    "RAJKOT",
    "SURAT",
    "Sabarkantha",
    "Surendra Nagar",
    "TAPI",
    "VADODARA",
    "VALSAD"
  ];

  static const List<String> HARYANA = [
    "AMBALA",
    "BHIWANI",
    "CHARKI DADRI",
    "FARIDABAD",
    "FATEHABAD",
    "GURUGRAM",
    "HISAR",
    "JHAJJAR",
    "JIND",
    "KAITHAL",
    "KARNAL",
    "KURUKSHETRA",
    "MAHENDRAGARH",
    "MEWAT",
    "PALWAL",
    "PANCHKULA",
    "PANIPAT",
    "REWARI",
    "ROHTAK",
    "SIRSA",
    "SONIPAT",
    "Yamuna Nagar"
  ];

  static const List<String> HIMACHAL_PRADESH = [
    "BILASPUR",
    "CHAMBA",
    "HAMIRPUR",
    "KANGRA",
    "KINNAUR",
    "KULLU",
    "Lahul & Spiti",
    "MANDI",
    "SHIMLA",
    "SIRMAUR",
    "SOLAN",
    "UNA"
  ];

  static const List<String> JAMMU_AND_KASHMIR = [
    "Ananthnag",
    "BARAMULLA",
    "Bandipur",
    "Budgam",
    "DODA",
    "GANDERBAL",
    "JAMMU",
    "KATHUA",
    "KISHTWAR",
    "KULGAM",
    "KUPWARA",
    "POONCH",
    "PULWAMA",
    "RAJAURI",
    "RAMBAN",
    "REASI",
    "SAMBA",
    "SHOPIAN",
    "SRINAGAR",
    "UDHAMPUR"
  ];

  static const List<String> JHARKHAND = [
    "BOKARO",
    "CHATRA",
    "DEOGHAR",
    "DHANBAD",
    "DUMKA",
    "EastSinghbhum",
    "GARHWA",
    "GODDA",
    "GUMLA",
    "Giridh",
    "Hazaribag",
    "JAMTARA",
    "KHUNTI",
    "KODERMA",
    "LATEHAR",
    "LOHARDAGA",
    "PAKUR",
    "Palamau",
    "RAMGARH",
    "RANCHI",
    "SIMDEGA",
    "Sahibganj",
    "SeraikelaKharsawan",
    "WESTSINGHBHUM"
  ];

  static const List<String> KARNATAKA = [
    "Uknown",
    "BAGALKOT",
    "BALLARY",
    "BANGALORE RURAL",
    "BANGALORE",
    "BELAGAVI",
    "BIDAR",
    "CHAMARAJNAGAR",
    "CHITRADURGA",
    "Chikamagalur",
    "DAKSHINA KANNADA",
    "DAVANGERE",
    "DHARWAD",
    "GADAG",
    "HASSAN",
    "HAVERI",
    "KALABURAGI",
    "KODAGU",
    "KOLAR",
    "KOPPAL",
    "MANDYA",
    "MYSORE",
    "RAICHUR",
    "RAMANAGAR",
    "SHIMOGA",
    "TUMKUR",
    "UDUPI",
    "UTTARA KANNADA",
    "VIJAYAPURA",
    "YADGIR"
  ];

  static const List<String> KERALA = [
    "ALAPPUZHA",
    "ERNAKULAM",
    "IDUKKI",
    "KANNUR",
    "KASARGOD",
    "KOLLAM",
    "KOTTAYAM",
    "KOZHIKODE",
    "MALAPPURAM",
    "PALAKKAD",
    "PATHANAMTHITTA",
    "THIRUVANANTHAPURAM",
    "THRISSUR",
    "WAYANAD"
  ];

  static const List<String> LADAKH = ["KARGIL", "LEH LADAKH"];

  static const List<String> LAKSHADWEEP = ["LAKSHADWEEP"];

  static const List<String> MADHYA_PRADESH = [
    "AGAR MALWA",
    "ALIRAJPUR",
    "ANUPPUR",
    "ASHOK NAGAR",
    "BALAGHAT",
    "BARWANI",
    "BETUL",
    "BHIND",
    "BHOPAL",
    "BURHANPUR",
    "CHHATARPUR",
    "CHHINDWARA",
    "DAMOH",
    "DATIA",
    "DEWAS",
    "DHAR",
    "DINDORI",
    "EAST NIMAR",
    "GUNA",
    "GWALIOR",
    "HARDA",
    "HOSHANGABAD",
    "INDORE",
    "JABALPUR",
    "JHABUA",
    "KATNI",
    "KHARGONE",
    "MANDLA",
    "MANDSAUR",
    "MORENA",
    "NARSINGHPUR",
    "NEEMUCH",
    "PANNA",
    "RAISEN",
    "RAJGARH",
    "RATLAM",
    "REWA",
    "SAGAR",
    "SATNA",
    "SEHORE",
    "SEONI",
    "SHAHDOL",
    "SHAJAPUR",
    "SHEOPUR",
    "SHIVPURI",
    "SIDHI",
    "SINGRAULI",
    "TIKAMGARH",
    "UJJAIN",
    "UMARIA",
    "VIDISHA"
  ];

  static const List<String> MAHARASHTRA = [
    "AHMED NAGAR",
    "AKOLA",
    "AMRAVATI",
    "AURANGABAD",
    "BEED",
    "BHANDARA",
    "BULDHANA",
    "CHANDRAPUR",
    "DHULE",
    "GADCHIROLI",
    "GONDIA",
    "HINGOLI",
    "JALGAON",
    "JALNA",
    "KOLHAPUR",
    "LATUR",
    "MUMBAI SUBURBAN",
    "MUMBAI",
    "NAGPUR",
    "NANDED",
    "NANDURBAR",
    "NASHIK",
    "OSMANABAD",
    "PALGHAR",
    "PARBHANI",
    "PUNE",
    "RAIGARH(MH)",
    "RATNAGIRI",
    "SANGLI",
    "SATARA",
    "SINDHUDURG",
    "SOLAPUR",
    "THANE",
    "WARDHA",
    "WASHIM",
    "YAVATMAL"
  ];

  static const List<String> MANIPUR = [
    "Uknown",
    "BISHNUPUR",
    "CHANDEL",
    "CHURACHANDPUR",
    "IMPHAL EAST",
    "IMPHAL WEST",
    "JIRIBAM",
    "KAKCHING",
    "KAMJONG",
    "KANGPOKPI",
    "NONEY",
    "PHERZAWL",
    "SENAPATI",
    "TAMENGLONG",
    "TENGNOUPAL",
    "THOUBAL",
    "UKHRUL"
  ];

  static const List<String> MEGHALAYA = [
    "EAST GARO HILLS",
    "EAST JAINTIA HILLS",
    "EAST KHASI HILLS",
    "NORTH GARO HILLS",
    "RI BHOI",
    "SOUTH GARO HILLS",
    "SOUTH WEST GARO HILLS",
    "SOUTH WEST KHASI HILLS",
    "WEST GARO HILLS",
    "WEST JAINTIA HILLS",
    "WEST KHASI HILLS"
  ];

  static const List<String> MIZORAM = [
    "AIZAWL",
    "CHAMPHAI",
    "KOLASIB",
    "LAWNGTLAI",
    "LUNGLEI",
    "MAMMIT",
    "SAIHA",
    "SERCHHIP"
  ];

  static const List<String> NAGALAND = [
    "DIMAPUR",
    "KIPHIRE",
    "KOHIMA",
    "LONGLENG",
    "MOKOKCHUNG",
    "MON",
    "PEREN",
    "PHEK",
    "TUENSANG",
    "WOKHA",
    "ZUNHEBOTTO"
  ];

  static const List<String> NCT_OF_DELHI = [
    "CENTRAL DELHI",
    "EAST DELHI",
    "NEW DELHI",
    "NORTH DELHI",
    "NORTH EAST DELHI",
    "NORTH WEST DELHI",
    "SOUTH DELHI",
    "SOUTH EAST DELHI",
    "SOUTH WEST DELHI",
    "WEST DELHI"
  ];

  static const List<String> ODISHA = [
    "ANGUL",
    "BALANGIR",
    "CUTTACK",
    "DHENKANAL",
    "GANJAM",
    "JAGATSINGHAPUR",
    "JHARSUGUDA",
    "KALAHANDI",
    "KENDUJHAR",
    "KHORDA",
    "KORAPUT",
    "NUAPADA",
    "RAYAGADA",
    "SAMBALPUR",
    "SUNDERGARH"
  ];

  static const List<String> PSU = ["Mo Home Affairs"];

  static const List<String> PUDUCHERRY = [
    "KARAIKAL",
    "MAHE",
    "PONDICHERRY",
    "YANAM"
  ];

  static const List<String> PUNJAB = [
    "AMRITSAR",
    "BARNALA",
    "BATHINDA",
    "FARIDKOT",
    "FATEHGARH SAHIB",
    "FAZILKA",
    "FIROZPUR",
    "GURDASPUR",
    "HOSHIARPUR",
    "JALANDHAR",
    "KAPURTHALA",
    "LUDHIANA",
    "MANSA",
    "MOGA",
    "MUKTSAR",
    "PATHANKOT",
    "PATIALA",
    "RUPNAGAR",
    "S.A.S Nagar",
    "SANGRUR",
    "Shahid Bhagat Singh Nagar",
    "Tarn Taran"
  ];

  static const List<String> RAJASTHAN = [
    "AJMER",
    "ALWAR",
    "BANSWARA",
    "BARAN",
    "BARMER",
    "BHARATPUR",
    "BHILWARA",
    "BIKANER",
    "BUNDI",
    "CHITTORGARH",
    "CHURU",
    "DAUSA",
    "DHOLPUR",
    "DUNGARPUR",
    "GANGANAGAR",
    "HANUMANGARH",
    "JAIPUR",
    "JAISALMER",
    "JALOR",
    "JHALAWAR",
    "JHUJHUNU",
    "JODHPUR",
    "KARAULI",
    "KOTA",
    "NAGAUR",
    "PALI",
    "PRATAPGARH",
    "RAJSAMAND",
    "SAWAI MADHOPUR",
    "SIKAR",
    "SIROHI",
    "TONK",
    "UDAIPUR"
  ];

  static const List<String> SIKKIM = [
    "East Sikkim",
    "North Sikkim",
    "South Sikkim",
    "West Sikkim"
  ];

  static const List<String> TAMIL_NADU = [
    "Uknown",
    "Ariyalur",
    "CHENNAI",
    "COIMBATORE",
    "CUDDALORE",
    "DHARMAPURI",
    "DINDIGUL",
    "ERODE",
    "KANCHIPURAM",
    "KARUR",
    "KRISHNAGIRI",
    "KANYAKUMARI",
    "MADURAI",
    "NAGAPATTINAM",
    "NAMAKKAL",
    "Nilgiris",
    "PERAMBALUR",
    "PUDUKKOTTAI",
    "RAMANATHAPURAM",
    "SALEM",
    "SIVAGANGA",
    "THANJAVUR",
    "THENI",
    "TIRUCHIRAPPALLI",
    "TIRUNELVELI",
    "TIRUPPUR",
    "TIRUVANNAMALAI",
    "TUTICORIN",
    "Tiruvallur",
    "Tiruvarur",
    "VELLORE",
    "VILLUPURAM",
    "VIRUDHUNAGAR"
  ];

  static const List<String> TELANGANA = [
    "ADILABAD",
    "BHADRADRI KOTHAGUDEM",
    "HYDERABAD",
    "JANGOAN",
    "JAYASHANKAR BHUPALAPALLY",
    "JOGULAMBA GADWAL",
    "Jagitial",
    "KAMAREDDY",
    "KARIMNAGAR",
    "KHAMMAM",
    "KUMURAM BHEEM ASIFABAD",
    "MAHABUBABAD",
    "MAHABUBNAGAR",
    "MANCHERIAL",
    "MEDAK",
    "MEDCHAL MALKAJGIRI",
    "NAGARKURNOOL",
    "NALGONDA",
    "NIZAMABAD",
    "Nirmal",
    "PEDDAPALLI",
    "RAJANNA SIRCILLA",
    "RANGA REDDY",
    "SANGAREDDY",
    "SIDDIPET",
    "SURYAPET",
    "VIKARABAD",
    "WANAPARTHY",
    "WARANGAL RURAL",
    "WARANGAL URBAN",
    "YADADRI BHUVANAGIRI"
  ];

  static const List<String> TRIPURA = [
    "Dhalai",
    "Gomati",
    "Khowai",
    "North Tripura",
    "Sepahijala",
    "South Tripura",
    "Unakoti",
    "West Tripura"
  ];

  static const List<String> UTTARAKHAND = [
    "ALMORA",
    "BAGESHWAR",
    "CHAMOLI",
    "CHAMPAWAT",
    "DEHRADUN",
    "HARIDWAR",
    "NAINITAL",
    "PAURI GARHWAL",
    "PITHORAGARH",
    "Rudraprayag",
    "TEHRI GARHWAL",
    "Udham Singh Nagar",
    "Uttarkashi"
  ];

  static const List<String> UTTAR_PRADESH = [
    "AGRA",
    "ALIGARH",
    "ALLAHABAD",
    "AMBEDKAR NAGAR",
    "AMROHA",
    "AURAIYA",
    "AZAMGARH",
    "Amethi",
    "BAHRAICH",
    "BALLIA",
    "BALRAMPUR",
    "BANDA",
    "BARABANKI",
    "BAREILLY",
    "BASTI",
    "BHADOHI",
    "BIJNOR",
    "BUDAUN",
    "BULANDSHAHR",
    "BAGPAT",
    "CHANDAULI",
    "CHITRAKOOT",
    "DEORIA",
    "ETAH",
    "ETAWAH",
    "FAIZABAD",
    "FARRUKHABAD",
    "FATEHPUR",
    "FIROZABAD",
    "GAUTAM BUDDHA NAGAR",
    "GHAZIABAD",
    "GHAZIPUR",
    "GONDA",
    "GORAKHPUR",
    "HAMIRPUR",
    "HAPUR",
    "HARDOI",
    "HATHRAS",
    "JALAUN",
    "JAUNPUR",
    "JHANSI",
    "KANNAUJ",
    "KANPUR DEHAT",
    "KANPUR NAGAR",
    "KAUSHAMBI",
    "KHERI",
    "KUSHI NAGAR",
    "Kasganj",
    "LALITPUR",
    "LUCKNOW",
    "MAHARAJGANJ",
    "MAHOBA",
    "MAINPURI",
    "MATHURA",
    "MAU",
    "MEERUT",
    "MIRZAPUR",
    "MORADABAD",
    "MUZAFFARNAGAR",
    "PILIBHIT",
    "PRATAPGARH",
    "RAMPUR",
    "Raebareli",
    "SAHARANPUR",
    "SHAHJAHANPUR",
    "SHAMLI",
    "SITAPUR",
    "SONBHADRA",
    "SULTANPUR",
    "Sambhal",
    "Sant Kabir Nagar",
    "Shrawasti",
    "Siddharthnagar",
    "UNNAO",
    "VARANASI"
  ];

  static const List<String> WEST_BENGAL = [
    "Alipurduar",
    "BANKURA",
    "Cooch Behar",
    "Darjiling",
    "East Midnapur",
    "HOWRAH",
    "JALPAIGURI",
    "Jhargram",
    "KOLKATA",
    "MURSHIDABAD",
    "Malda",
    "NADIA",
    "North 24 Parganas",
    "North Dinajpur",
    "PASCHIM BARDHAMAN",
    "Puruliya",
    "South Dinajpur",
    "West Midnapur"
  ];
}
