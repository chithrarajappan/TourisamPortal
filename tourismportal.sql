-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2019 at 01:31 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourismportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agencyregister`
--

CREATE TABLE `tbl_agencyregister` (
  `id` int(11) NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `account` varchar(15) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `agencyid` int(11) NOT NULL,
  `logid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_agencyregister`
--

INSERT INTO `tbl_agencyregister` (`id`, `agency_name`, `contact_number`, `account`, `nationality`, `address`, `street`, `city`, `email_id`, `agencyid`, `logid`) VALUES
(1, 'h4Hollidays', '12234211', '9876788990', 'aaa', 'aqqa', 'qaaq', 'qwwq', 'ashimkichu@gmail.com', 5, 7),
(2, 'h4Hollidays', '2323232323', '6778767789', 'asdde', 'address', 'street', 'city', 'ashimkichu@gmail.com', 5, 8),
(3, 'Rozzario Travels', '4712536658', '', 'India', 'Rozzario', 'kottiyam', 'Kollam', 'ashimkichu@gmail.com', 6, 15),
(4, 'h4Hollidays', '67766755', '675565667876', 'india', 'h4hollidays', 'kollam', 'kollam', 'ashim@gmail.com', 5, 21),
(5, 'Discover Kerala', '7736233693', '5667677675', 'India', 'Discover Kerala, 2nd Floor Old NGK building', 'Mananthavady', 'Wayanad', 'ashimkichu@gmail.com', 7, 24);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agentoffers`
--

CREATE TABLE `tbl_agentoffers` (
  `id` int(11) NOT NULL,
  `newsletterid` int(11) NOT NULL,
  `offername` varchar(100) NOT NULL,
  `places` varchar(200) NOT NULL,
  `days` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `foodaccomodation` varchar(20) NOT NULL,
  `transportation` varchar(20) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `agentid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_agentoffers`
--

INSERT INTO `tbl_agentoffers` (`id`, `newsletterid`, `offername`, `places`, `days`, `amount`, `foodaccomodation`, `transportation`, `description`, `agentid`, `status`) VALUES
(1, 1, 'asfdzgx', 'dgsdf,xghxfg,dryjsrh\r\nhsrthsr\r\nfhjcjfh', '5', 2233, 'yes', 'yes', 'xvsdthyi\r\nucghjrtshsrthdfgerg\r\ntjdtyjsr', 22, 0),
(2, 2, 'valentines weak', 'munnar,wayanad', '4', 4500, 'yes', 'yes', '4 day trip to enjoy this weekend with your valentine on this valentines week\r\nat the most romantic places in south india\r\n1 day at munnar,1 day at ooty and 1 day and night in coorg with stay at coorg', 8, 1),
(3, 2, 'valentines weak', 'wayanad,coorg,ooty', '4', 4500, 'yes', 'no', '4 day trip to enjoy this weekend with your valentine on this valentines week\r\nat the most romantic places in south india\r\n1 day at munnar,1 day at ooty and 1 day and night in coorg with stay at coorg', 8, 1),
(4, 1, 'valentines weak', 'ooty,coorg', '5', 5000, 'yes', 'no', 'hgcgfhh', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agentpackages`
--

CREATE TABLE `tbl_agentpackages` (
  `id` int(11) NOT NULL,
  `packageid` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `placestovisit` varchar(250) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `no_of_days` varchar(30) NOT NULL,
  `day1` varchar(1600) DEFAULT NULL,
  `day2` varchar(1600) DEFAULT NULL,
  `day3` varchar(1600) DEFAULT NULL,
  `day4` varchar(1600) DEFAULT NULL,
  `day5` varchar(1600) DEFAULT NULL,
  `day6` varchar(1600) DEFAULT NULL,
  `day7` varchar(1600) DEFAULT NULL,
  `nativeamount` int(11) NOT NULL,
  `foreignamount` int(11) NOT NULL,
  `inclusions` varchar(500) NOT NULL,
  `exclusions` varchar(500) NOT NULL,
  `transportation` varchar(100) NOT NULL,
  `logid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_agentpackages`
--

INSERT INTO `tbl_agentpackages` (`id`, `packageid`, `package_name`, `placestovisit`, `description`, `no_of_days`, `day1`, `day2`, `day3`, `day4`, `day5`, `day6`, `day7`, `nativeamount`, `foreignamount`, `inclusions`, `exclusions`, `transportation`, `logid`) VALUES
(1, 3, 'summer holiday', 'Munnar,Vagamon,Gavi', 'A three Day tour package to the most beautifull places in souther kerala . the most attractive hill station of kerala Munnar, The peak point of kottayam vagoman and the beautiful wild life experience of south kerala Gavi ', '3', 'Day1- Munnar is a place that can take your breath away and transport you to a whole new world!\n             \nAfter Breakfast explore various sights such as Nursery Garden-Madupetty Dam- Boating Point- Jungle Honeybee Nest. \nor Echo Point-Photo Point-Tea Museum       After Launch proceed to enjoy wildlife experience in Eravikulam-Rajamalai National Park- Anaimudi Peak-Pothameduand sunset view point.', 'Day 2-Vagamon still retains its virgin nature in its surroundings.\n Vagamon is renowned for its shola grass lands (Motta Kunnu in Malayalam) and romancing pine forests.\nAfter Breakfast proceed for sightseeing/Trek Kurishumala-Thangal Para Enjoy the nature. \nAfter lunch, proceed for sightseeing Vagamon Meadows (Mottakunnu) where you will have a nice time to relax in the cool atmosphere. \nAfter this we proceed to the, Paragliding point-Pine forest Valley.', 'Day 3-Gavi is mainly known for its wildlife. Endangered species including the Nilgiri Tahr and Lion-tailed macaque are often sighted at the outskirts of Gavi.\n Kerala’s very own treasure elephants can be sighted abundantly. If you are the bird watcher, Gavi is the place for you.\nAfter breakfast you can enjoy the sight of this wildlife in their natural habitat through Jeep safaris to take a glimpse of the endangered species\nAfter launch Boat ride-plantation visit-Museum', 'null', 'null', 'null', 'null', 4000, 7000, 'Accommodation,Transpotation', 'All personal expenses,Outside Food', 'Available options of transportation  for this package are Innova or Etios ', 8),
(2, 3, 'Mega offer', 'Wayanad,Mysore', 'Featured Attractions: Brindavan Gardens, Mysore Zoo, Muthanga Wildlife Sanctuary, Mysore Palace, Chamundi Hills, Ranganathittu Bird Sanctuary, Wayanad Wildlife Sanctuary, Sulthan Bathery', '4', 'Arrive at Mysore and visit Chamundi Hills (temple dedicated to goddess Chamundi), Nandi Statue, Wax Museum, Mysore Zoo, Mysore Palace, St. Philominas Church, Tippu Summaer Palace, Ranganath Swamy Temple, Ranganthittu Bird Sanctuary. Spend the evening at Brindavan Gardens behind the Krishnaraja Sagar Dam. The garden has innumerable fountains which dance to the music every evening. This Garden has been the filming location for many Hindi movie of bygone days. Overnight stay at hotel.\n\n', 'After breakfast, drive to Wayanad. Enroute visit the Wayanad Wildlife and Muthanga sanctuaries, which offer sightings of free ranging wildlife like herds of elephants, gaurs, deers, wild cats and many species of reptiles, fishes, butterflies and birds. Next visit Sulthan Bathery, which is an artillery battery that was used by Tipu Sultan. Arrive at Wayanad by afternoon and check in at the hotel. Evening drive to Sunrise valley to witness a spectacular sunset. Overnight at the hotel.', 'After breakfast proceed for a sightseeing of Pookode lake, a scenic freshwater lake, and Lakkidi, which receives the second highest rainfall in India. Thereafter visit Soochipara falls and end the day with a visit to Chembra peak. Overnight at the hotel.', 'After breakfast, check out from the hotel. Board the transportation for your onward journey.', 'null', 'null', 'null', 4500, 6000, 'Accommodation', 'All personal expenses', 'Available options of transportation  for this package are Innova or Etios ', 7),
(3, 2, 'Destination Honeymoon', 'Shimla\r\nManali', 'Located in the Himalayas, the northern Indian state of Himachal Pradesh is replete with snowy mountains, lush forests, hilly terrains, and numerous water bodies. From the surreal terrain of Manali Tour Package to hill stations in Kully Manali Valley, Himachal is like a cupboard full of boxes waiting to be explored. The Shimla Kullu Manali Honeymoon tour packages are highly popular in North India because of the scenic beauty and pleasant climate of the state. The ?Abode of Snow? is known for its adventure activities, religious centers, colonial heritage, and romantic getaways. Hence, opting for Himachal Tour Package is a true delight for every kind of tourist, whether they are adventure enthusiasts, explorers, nature lovers.', '4', 'Arrive at Shimla - Chandigarh 120 Km / 3 Hrs\n\nPick up from Kalka / Chandigarh Airport / Railway Station / Bus Stand by exclusive vehicle. Drive to Shimla .On Arrival in Shimla , Check in hotel and take some rest . In Afternoon visit to the famous visit Mall Road Shimla like , Lakkar Bazaar, Ridge, Church, Mall road, Scandal Point, Kali Bari temple & Indian Institute of advance Studies, Army Museum, Jakhoo temple etc. Overnight Stay in Shimla.', 'Shimla Kufri Naldehra\n\nAfter Breakfast visit to the famous picnic spots around Shimla which include Fagu, Kufri, Naldehra and Mashobra. Enjoy horse / Yak ride, see Himalayan national park at Kufri. See apple orchards at Mashobra, Golf course and Jungle walks in Naldehra and Take Some Rest , visit to the years old Tara Devi Temple, Sankat Mochan Temple, visit Indian Institute of advance Studies, Army Museum, Jakhoo temple visit Mall Road Shimla like , Lakkar Bazaar, Ridge, Church, Mall road, Scandal Point, Kali Bari temple etc. Overnight Stay in Shimla. Dinner & Night Stay in Hotel in Shimla.', 'Shimla - Manali 250 Km / 7 Hrs Kullu Manikaran\n\nAfter Breakfast , Drive to Manali (7-8 Hours) & on the way visit kullu & Manikran , valley of Gods, is a combination of natural splendour and rich cultural heritage. On the way stop a while at Pandoh and Kullu. Rest of the day at leisure. Night stay in Manali.', 'Manali Rohtang Pass / Snow Point\n\nEarly Morning proceed for full day tour of Rohtang Pass – The majesty of the mountains and the glaciers can be seen at their best After enjoying this snowy heaven, take a sledge ride down the slopes & try luck by climbing the little snow hills. On descending to Manali, halt at the Rahalla falls and Solang Valley. The Magnificent views and natural beauty are a never-ending source of delight. Also halt at Marhi, Ralha falls, Nehru Kund. Night Stay in Hotel', 'null', 'null', 'null', 10000, 12500, 'Accommodation Transpotation Room for refreshment ', 'All personal expenses Outside Food Optional activities ', 'car', 24);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank`
--

CREATE TABLE `tbl_bank` (
  `id` int(11) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `cvv` int(11) NOT NULL,
  `cardno` int(11) NOT NULL,
  `expirydate` varchar(50) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bank`
--

INSERT INTO `tbl_bank` (`id`, `bankname`, `username`, `cvv`, `cardno`, `expirydate`, `balance`) VALUES
(1, 'SBI', 'abcd', 123, 123456789, '12-10-2019', 52600),
(2, 'ICIC', 'qerrt', 345, 987654321, '20-07-2020', 4000),
(3, 'SBI', 'vbnm', 981, 157913579, '03-04-2022', 4733550),
(4, 'AXIS', 'tyuio', 678, 246886421, '03-05-2033', 25999);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog`
--

CREATE TABLE `tbl_blog` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `pubdate` varchar(50) NOT NULL,
  `bloger` varchar(50) NOT NULL,
  `image` varchar(1500) NOT NULL,
  `logid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_blog`
--

INSERT INTO `tbl_blog` (`id`, `title`, `description`, `pubdate`, `bloger`, `image`, `logid`) VALUES
(1, 'Vagamon  Hills', 'Vagamon is a hill station located in Kottayam- Idukki border of Kerala. It has a cool climate with the temperature between 10-23°C during a summer midday. It is situated 1,100 metres above sea level. Vagamon is a tiny plantation township in Central Travancore, Vagamon has an overtone of green. With a never-ending line of lush green hills, breathtaking ravines and meandering rivulets. A perfect tourist place situated 1200 meters above the sea level spot surrounded by the greenery of tea gardens , Fresh cool air, murmuring Pine forest ,small waterfalls , attractive meadows inviting you to vagamon.Reaching Vagamon itself is an extraordinary experience. The meandering road to Vagamon is cut in solid rock lined with pine forests. And as you wind your way through green capped hills, the rolling plains come into view thousands of feet below you. Vagamon is a tiny plantation township in Central Travancore, Vagamon has an overtone of green. With a never-ending line of lush green hills, breathtaking ravines and meandering rivulets. A perfect tourist place situated 1200 meters above the sea level spot surrounded by the greenery of tea gardens \nAddress: Vagamon, Kerala 685503\nState : Kerala\nDistrict : Kottayam\nNearest railway Station : Kottayam\nNearest Bus Station : Erattupetta\nPoint of Interest : Vagamon Kurishumala Church,Thangalpara,Vagamon Hills', 'April-23-2019 ', 'Admin', 'v7.jpg', 1),
(2, 'Gavi Land', ' Gavi is a small village situated in border of Pathanamthitta district and Idukki district which is an Eco-Tourism project promoted by Kerala Forest Development Corporation. This place came to limelight after \'Alistair International\' the world acclaimed tourism major ranked it as leading eco tourism centre and must see place in India. This has caught the attention of tourist and nature lovers from across the world especially from European countries. Gavi is a beautiful, unadulterated and quiet forest haven abundant with carnivorous, herbivorous and omnivorous wildlife. The flora and fauna of this place is loved by nature explorers who can get acquainted with rare plants and herbs. The highly endemic species of the Gymnosperm family like the Nageia Wallichinia or Podocarpus Wallichinia is seen only here. Gavi is home to over 320 species of birds and it attracts Ornithologists from all over the world. Gavi offers adventure tours like trekking, wildlife watching, outdoor camping, night safaris, boating in the reservoir, canoeing and Jeep safari. Tourist can camp in the forest or stay in tree houses and light a bone fire to keep the chill out during the night. The journey to this lovely spot is blanketed by tea plantation along the curvy roads with an eye catching view of the hills, valleys, tropical forests, shoals, beautiful grasslands, cascading waterfalls and cardamom plantations on the way. Tourists are provided with vegetarian food and snacks by restaurants which boost the eco-friendly ambiance of Gavi. Involvement of local and the tribal?s makes Gavi unique and one of its kind in the country and helps to sustain the surrounding in its original state without any modernity. Gavi casts a magical spell on visitors who will remember the experience of this enchanting place for a long time.\r\nAddress: District	Pathanamthitta district Kerala pin-353464\r\nState : Kerala\r\nDistrict : Kottayam\r\nNearest railway Station : Tiruvalla\r\nNearest Bus Station : idukki\r\nPoint of Interest : indian elephants near Gavi,Malabar giant squirrel found in Gavi', 'April-23-2019 ', 'Admin', 'g2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blogcomment`
--

CREATE TABLE `tbl_blogcomment` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(300) NOT NULL,
  `blogid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `id` int(11) NOT NULL,
  `logid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL,
  `idproof` varchar(50) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `date1` varchar(30) NOT NULL,
  `type1` varchar(20) NOT NULL,
  `days` int(11) NOT NULL,
  `rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`id`, `logid`, `name`, `phone`, `address`, `idproof`, `hotelid`, `date1`, `type1`, `days`, `rooms`) VALUES
(1, 2, 'Chithra Rajappan', '7736118104', 'gdffhg', 'passport', 25, '2019-06-28', 'doubl', 4, 1),
(2, 3, 'Ashim n', '9526074513', 'Ashik Manzil', 'adhaar', 12, '2019-06-22', 'family', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contactus`
--

CREATE TABLE `tbl_contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contactus`
--

INSERT INTO `tbl_contactus` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'chithra', 'chithrarajappan90@gmail.com', 'tourist offer', 'what are the summer offer?');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `did` int(11) NOT NULL,
  `districtname` varchar(50) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`did`, `districtname`, `sid`) VALUES
(1, 'Anantapur', 1),
(2, 'Chittoor', 1),
(3, 'East Godavari', 1),
(4, 'Guntur', 1),
(5, 'Kadapa', 1),
(6, 'Krishna', 1),
(7, 'Kurnool', 1),
(8, 'Prakasam', 1),
(9, 'Srikakulam', 1),
(10, 'Vishakapatnam', 1),
(11, 'Vizianagaram', 1),
(12, 'West Godavari', 1),
(13, 'Anjaw', 2),
(14, 'Changlang', 2),
(15, 'Dibang Valley', 2),
(16, 'East Kameng', 2),
(17, 'East Siang', 2),
(18, 'Kamle', 2),
(19, 'Kra Daadi', 2),
(20, 'Kurung Kumey', 2),
(21, 'Lepa Rada', 2),
(22, 'Lohit', 2),
(23, 'Longding', 2),
(24, 'Lower Dibang Valley', 2),
(25, 'Lower Siang', 2),
(26, 'LowerSubansiri', 2),
(27, 'Namsai', 2),
(28, 'Pakke Kessang', 2),
(29, 'Papum Pare', 2),
(30, 'Shi Yomi', 2),
(31, 'Siang', 2),
(32, 'Tawang', 2),
(33, 'Tirap', 2),
(34, 'Upper Siang', 2),
(35, 'Upper Subansiri', 2),
(36, 'West Kameng', 2),
(37, 'West Siang', 2),
(38, 'Baksa', 3),
(39, 'Barpeta', 3),
(40, 'Biswanath', 3),
(41, 'Bongaigaon', 3),
(42, 'Cachar', 3),
(43, 'Charaideo', 3),
(44, 'Chirang', 3),
(45, 'Darrang', 3),
(46, 'Dhemaji', 3),
(47, 'Dhubri', 3),
(48, 'Dibrugarh', 3),
(49, 'Dima Hasao (North Cachar Hills)', 3),
(50, 'Goalpara', 3),
(51, 'Golaghat', 3),
(52, 'Hailakandi', 3),
(53, 'Hojai', 3),
(54, 'Jorhat', 3),
(55, 'Kamrup', 3),
(56, 'Kamrup Metropolitan', 3),
(57, 'Karbi Anglong', 3),
(58, 'Karimganj', 3),
(59, 'Kokrajhar', 3),
(60, 'Lakhimpur', 3),
(61, 'Majuli', 3),
(62, 'Morigaon', 3),
(63, 'Nagaon', 3),
(64, 'Nalbari', 3),
(65, 'Sivasagar', 3),
(66, 'Sonitpur', 3),
(67, 'South Salamara-Mankachar', 3),
(68, 'Tinsukia', 3),
(69, 'Udalguri', 3),
(70, 'West Karbi Anglong', 3),
(71, 'Araria', 4),
(72, 'Arwal', 4),
(73, 'Aurangabad', 4),
(74, 'Banka', 4),
(75, 'Begusarai', 4),
(76, 'Bhagalpur', 4),
(77, 'Bhojpur', 4),
(78, 'Buxar', 4),
(79, 'Darbhanga', 4),
(80, 'East Champaran', 4),
(81, 'Gaya', 4),
(82, 'Gopalganj', 4),
(83, 'Jamui', 4),
(84, 'Jehanabad', 4),
(85, 'Kaimur', 4),
(86, 'Katihar', 4),
(87, 'Khagaria', 4),
(88, 'Kishanganj', 4),
(89, 'Lakhisarai', 4),
(90, 'Madhepura', 4),
(91, 'Madhubani', 4),
(92, 'Monghyr', 4),
(93, 'Muzaffarpur', 4),
(94, 'Nalanda', 4),
(95, 'Nawada', 4),
(96, 'Patna', 4),
(97, 'Purnea', 4),
(98, 'Rohtas', 4),
(99, 'Saharsa', 4),
(100, 'Samastipur', 4),
(101, 'Saran', 4),
(102, 'Shiekhpura', 4),
(103, 'Sheohar', 4),
(104, 'Sitamarhi', 4),
(105, 'Siwan', 4),
(106, 'Supaul', 4),
(107, 'Vaishali', 4),
(108, 'West Champaran', 4),
(109, 'Balod', 5),
(110, 'Baloda Bazar', 5),
(111, 'Balrampur', 5),
(112, 'Bastar', 5),
(113, 'Bemetara', 5),
(114, 'Bijapur', 5),
(115, 'Bilaspur', 5),
(116, 'Dantewada (South Bastar)', 5),
(117, 'Dhamtari', 5),
(118, 'Durg', 5),
(119, 'Gariyaband', 5),
(120, 'Janjgir-Champa', 5),
(121, 'Jashpur', 5),
(122, 'Kabirdham (Kawardha)', 5),
(123, 'Kanker (North Bastar)', 5),
(124, 'Kondagaon', 5),
(125, 'Korba', 5),
(126, 'Korea (Koriya)', 5),
(127, 'Mahasamund', 5),
(128, 'Mungeli', 5),
(129, 'Narayanpur', 5),
(130, 'Raigarh', 5),
(131, 'Raipur', 5),
(132, 'Rajnandgaon', 5),
(133, 'Sukma', 5),
(134, 'Surajpur', 5),
(135, 'Surguja', 5),
(136, 'North Goa', 6),
(137, 'South Goa', 6),
(138, 'Ahmedabad', 7),
(139, 'Amreli', 7),
(140, 'Anand', 7),
(141, 'Aravalli', 7),
(142, 'Banaskantha (Palanpur)', 7),
(143, 'Bharuch', 7),
(144, 'Bhavnagar', 7),
(145, 'Botad', 7),
(146, 'Chhota Udepur', 7),
(147, 'Dahod', 7),
(148, 'Dangs (Ahwa)', 7),
(149, 'Devbhoomi Dwarka', 7),
(150, 'Gandhinagar', 7),
(151, 'Gir Somnath', 7),
(152, 'Jamnagar', 7),
(153, 'Junagadh', 7),
(154, 'Kachchh', 7),
(155, 'Kheda (Nadiad)', 7),
(156, 'Mahisagar', 7),
(157, 'Mehsana', 7),
(158, 'Morbi', 7),
(159, 'Narmada (Rajpipla)', 7),
(160, 'Navsari', 7),
(161, 'Panchmahal (Godhra)', 7),
(162, 'Patan', 7),
(163, 'Porbandar', 7),
(164, 'Rajkot', 7),
(165, 'Sabarkantha (Himmatnagar)', 7),
(166, 'Surat', 7),
(167, 'Surendranagar', 7),
(168, 'Tapi (Vyara)', 7),
(169, 'Vadodara', 7),
(170, 'Valsad', 7),
(171, 'Ambala', 8),
(172, 'Bhiwani', 8),
(173, 'Charkhi Dadri', 8),
(174, 'Faridabad', 8),
(175, 'Fatehabad', 8),
(176, 'Gurgaon', 8),
(177, 'Hisar', 8),
(178, 'Jhajjar', 8),
(179, 'Jind', 8),
(180, 'Kaithal', 8),
(181, 'Karnal', 8),
(182, 'Kurukshetra', 8),
(183, 'Mahendragarh', 8),
(184, 'Mewat', 8),
(185, 'Palwal', 8),
(186, 'Panchkula', 8),
(187, 'Panipat', 8),
(188, 'Rewari', 8),
(189, 'Rohtak', 8),
(190, 'Sirsa', 8),
(191, 'Sonipat', 8),
(192, 'Yamunanagar', 8),
(193, 'Bilaspur', 9),
(194, 'Chamba', 9),
(195, 'Hamirpur', 9),
(196, 'Kangra', 9),
(197, 'Kinnaur', 9),
(198, 'Kullu', 9),
(199, 'Lahaul & Spiti', 9),
(200, 'Mandi', 9),
(201, 'Shimla', 9),
(202, 'Sirmaur (Sirmour)', 9),
(203, 'Solan', 9),
(204, 'Una', 9),
(205, 'Anantnag', 10),
(206, 'Bandipore', 10),
(207, 'Baramulla', 10),
(208, 'Budgam', 10),
(209, 'Doda', 10),
(210, 'Ganderbal', 10),
(211, 'Jammu', 10),
(212, 'Kargil', 10),
(213, 'Kathua', 10),
(214, 'Kishtwar', 10),
(215, 'Kulgam', 10),
(216, 'Kupwara', 10),
(217, 'Leh', 10),
(218, 'Poonch', 10),
(219, 'Pulwama', 10),
(220, 'Rajouri', 10),
(221, 'Ramban', 10),
(222, 'Reasi', 10),
(223, 'Samba', 10),
(224, 'Shopian', 10),
(225, 'Srinagar', 10),
(226, 'Udhampur', 10),
(227, 'Bokaro', 11),
(228, 'Chatra', 11),
(229, 'Deoghar', 11),
(230, 'Dhanbad', 11),
(231, 'Dumka', 11),
(232, 'East Singhbhum', 11),
(233, 'Garhwa', 11),
(234, 'Giridih', 11),
(235, 'Godda', 11),
(236, 'Gumla', 11),
(237, 'Hazaribag', 11),
(238, 'Jamtara', 11),
(239, 'Khunti', 11),
(240, 'Koderma', 11),
(241, 'Latehar', 11),
(242, 'Lohardaga', 11),
(243, 'Pakur', 11),
(244, 'Palamu', 11),
(245, 'Ramgarh', 11),
(246, 'Ranchi', 11),
(247, 'Sahibganj', 11),
(248, 'Seraikela-Kharsawan', 11),
(249, 'Simdega', 11),
(250, 'West Singhbhum', 11),
(251, 'Bagalkot', 12),
(252, 'Ballari (Bellary)', 12),
(253, 'Belagavi (Belgaum)', 12),
(254, 'Bengaluru (Bangalore) Rural', 12),
(255, 'Bengaluru (Bangalore) Urban', 12),
(256, 'Bidar', 12),
(257, 'Chamarajanagar', 12),
(258, 'Chikballapur', 12),
(259, 'Chikkamagaluru (Chikmagalur)', 12),
(260, 'Chitradurga', 12),
(261, 'Dakshina Kannada', 12),
(262, 'Davangere', 12),
(263, 'Dharwad', 12),
(264, 'Gadag', 12),
(265, 'Hassan', 12),
(266, 'Haveri', 12),
(267, 'Kalaburagi (Gulbarga)', 12),
(268, 'Kodagu', 12),
(269, 'Kolar', 12),
(270, 'Koppal', 12),
(271, 'Mandya', 12),
(272, 'Mysuru (Mysore)', 12),
(273, 'Raichur', 12),
(274, 'Ramanagara', 12),
(275, 'Shivamogga (Shimoga)', 12),
(276, 'Tumakuru (Tumkur)', 12),
(277, 'Udupi', 12),
(278, 'Uttara Kannada (Karwar)', 12),
(279, 'Vijayapura (Bijapur)', 12),
(280, 'Yadgir', 12),
(281, 'Alappuzha', 13),
(282, 'Ernakulam', 13),
(283, 'Idukki', 13),
(284, 'Kannur', 13),
(285, 'Kasaragod', 13),
(286, 'Kollam', 13),
(287, 'Kottayam', 13),
(288, 'Kozhikode', 13),
(289, 'Malappuram', 13),
(290, 'Palakkad', 13),
(291, 'Pathanamthitta', 13),
(292, 'Thiruvananthapuram', 13),
(293, 'Thrissur', 13),
(294, 'Wayanad', 13),
(295, 'Agar Malwa', 14),
(296, 'Alirajpur', 14),
(297, 'Anuppur', 14),
(298, 'Ashoknagar', 14),
(299, 'Balaghat', 14),
(300, 'Barwani', 14),
(301, 'Betul', 14),
(302, 'Bhind', 14),
(303, 'Bhopal', 14),
(304, 'Burhanpur', 14),
(305, 'Chhatarpur', 14),
(306, 'Chhindwara', 14),
(307, 'Damoh', 14),
(308, 'Datia', 14),
(309, 'Dewas', 14),
(310, 'Dhar', 14),
(311, 'Dindori', 14),
(312, 'Guna', 14),
(313, 'Gwalior', 14),
(314, 'Harda', 14),
(315, 'Hoshangabad', 14),
(316, 'Indore', 14),
(317, 'Jabalpur', 14),
(318, 'Jhabua', 14),
(319, 'Katni', 14),
(320, 'Khandwa', 14),
(321, 'Khargone', 14),
(322, 'Mandla', 14),
(323, 'Mandsaur', 14),
(324, 'Morena', 14),
(325, 'Narsinghpur', 14),
(326, 'Neemuch', 14),
(327, 'Panna', 14),
(328, 'Raisen', 14),
(329, 'Rajgarh', 14),
(330, 'Ratlam', 14),
(331, 'Rewa', 14),
(332, 'Sagar', 14),
(333, 'Satna', 14),
(334, 'Sehore', 14),
(335, 'Seoni', 14),
(336, 'Shahdol', 14),
(337, 'Shajapur', 14),
(338, 'Sheopur', 14),
(339, 'Shivpuri', 14),
(340, 'Sidhi', 14),
(341, 'Singrauli', 14),
(342, 'Tikamgarh', 14),
(343, 'Ujjain', 14),
(344, 'Umaria', 14),
(345, 'Vidisha', 14),
(346, 'Ahmednagar', 15),
(347, 'Akola', 15),
(348, 'Amravati', 15),
(349, 'Aurangabad', 15),
(350, 'Beed', 15),
(351, 'Bhandara', 15),
(352, 'Buldhana', 15),
(353, 'Chandrapur', 15),
(354, 'Dhule', 15),
(355, 'Gadchiroli', 15),
(356, 'Gondia', 15),
(357, 'Hingoli', 15),
(358, 'Jalgaonv', 15),
(359, 'Jalna', 15),
(360, 'Kolhapur', 15),
(361, 'Latur', 15),
(362, 'Mumbai City', 15),
(363, 'Mumbai Suburban', 15),
(364, 'Nagpur', 15),
(365, 'Nanded', 15),
(366, 'Nandurbar', 15),
(367, 'Nashik', 15),
(368, 'Osmanabad', 15),
(369, 'Palghar', 15),
(370, 'Parbhani', 15),
(371, 'Pune', 15),
(372, 'Raigad', 15),
(373, 'Ratnagiri', 15),
(374, 'Sangli', 15),
(375, 'Satara', 15),
(376, 'Sindhudurg', 15),
(377, 'Solapur', 15),
(378, 'Thane', 15),
(379, 'Wardha', 15),
(380, 'Washim', 15),
(381, 'Yavatmal', 15),
(382, 'Bishnupur', 16),
(383, 'Chandel', 16),
(384, 'Churachandpur', 16),
(385, 'Imphal East', 16),
(386, 'Imphal West', 16),
(387, 'Jiribam', 16),
(388, 'Kakching', 16),
(389, 'Kamjong', 16),
(390, 'Kangpokpi', 16),
(391, 'Noney', 16),
(392, 'Pherzawl', 16),
(393, 'Senapati', 16),
(394, 'Tamenglong', 16),
(395, 'Tengnoupal', 16),
(396, 'Thoubal', 16),
(397, 'Ukhrul', 16),
(398, 'East Garo Hills', 17),
(399, 'East Jaintia Hills', 17),
(400, 'East Khasi Hills', 17),
(401, 'North Garo Hills', 17),
(402, 'Ri Bhoi', 17),
(403, 'South Garo Hills', 17),
(404, 'South West Garo Hills', 17),
(405, 'South West Khasi Hills', 17),
(406, 'West Garo Hills', 17),
(407, 'West Jaintia Hills', 17),
(408, 'West Khasi Hills', 17),
(409, 'Aizawl', 18),
(410, 'Champhai', 18),
(411, 'Kolasib', 18),
(412, 'Lawngtlai', 18),
(413, 'Lunglei', 18),
(414, 'Mamit', 18),
(415, 'Saiha', 18),
(416, 'Serchhip', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_foreignerregister`
--

CREATE TABLE `tbl_foreignerregister` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `nationality` varchar(25) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `id_proof` varchar(20) NOT NULL,
  `id_details` varchar(20) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `image` varchar(1300) DEFAULT NULL,
  `logid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_foreignerregister`
--

INSERT INTO `tbl_foreignerregister` (`id`, `name`, `contact_number`, `nationality`, `address`, `street`, `city`, `id_proof`, `id_details`, `email_id`, `image`, `logid`) VALUES
(1, 'Chithra Rajappan', '7736118104', 'U.S', 'gdffhg', 'fhdf', 'washington', 'passport', '098765567890', 'chithrarajappan730@gmail.com', 'iu 010.jpg', 2),
(2, 'Ashim n', '1234567890', 'american', 'ashik manzil', 'wcc', 'kollam', 'passport', '344355666776', 'ass@gmail.com', 'KTM-Duke-390-HD-Wallpapers-4.jpg', 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_homestaydetails`
--

CREATE TABLE `tbl_homestaydetails` (
  `id` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `hotelname` varchar(50) NOT NULL,
  `account` varchar(20) NOT NULL,
  `about` varchar(2500) NOT NULL,
  `nearby` varchar(200) NOT NULL,
  `carpark` varchar(25) NOT NULL,
  `ac` varchar(20) NOT NULL,
  `wifi` varchar(20) NOT NULL,
  `laundry` varchar(20) NOT NULL,
  `amountcharges` int(11) NOT NULL,
  `single` int(11) NOT NULL,
  `doubl` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `maplink` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_homestaydetails`
--

INSERT INTO `tbl_homestaydetails` (`id`, `hotelid`, `hotelname`, `account`, `about`, `nearby`, `carpark`, `ac`, `wifi`, `laundry`, `amountcharges`, `single`, `doubl`, `image`, `maplink`) VALUES
(1, 20, 'Vaithiri Home Stay', '65542314510', 'Set along the slope of a forest clad hill, beside three branches of a sprightly mountain stream that forks as it flows through the 150 acre property, coming together and broadening at the end of the slope, Vythiri Resort is an exquisite jungle hideaway and a naturalist\'s treasure trove. Wrapped in the enchantment of a tropical rainforest, beneath an enormous interlaced canopy formed by majestic trees, stone paved paths fringed by tropical plants wind through leading to brick coloured cottages, designed in architecture influenced to a great extent by the vernacular of the region. Built with wooden rafters on the roof and parquet flooring, furnished in wood and fabrics in a palette of earth colours - the accommodations are spacious, equipped with the state of the art in amenities and verandas that look out at fabulous views of the forest - an intimate experience of the surrounding sights and sounds. Available in configurations that range from lofty tree houses situated above the towering canopy higher up the slope of the hill and further down, cottages on stilts overlooking the stream, some equipped with Jacuzzis, others with private pools and a set of suites, they are all without exception, elegant and exclusive.\r\n\r\nA rope bridge across one branch of the stream (sways gently as one gets across) leads to a restaurant and a coffee shop alongside, both overlooking the swimming pool at one end and a sweeping view of the forest all around. Everywhere, the muted hiss of the stream is a continuous serenade. Days usually begin with the rousing melody of a Malabar Whistling Thrush and then the forest comes alive. Bands of foraging monkeys and insects and birds begin their life songs. The day ahead is ripe with possibilities -splendidly plumed tropical birds on overhanging branches, colourful butterflies and the insistent chatter of cicadas, the irresistible lure of the jungle - the incessant throb of nature is the only clock you will need here. Allow yourself to be seduced by the promise of discovery, bliss and exaltation - body, mind and soul.', 'Vythiri, Chembra peak, hridayathadkam, ooty', 'yes', 'no', 'yes', 'no', 1000, 2000, 2500, 'vythiri.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hoteldetails`
--

CREATE TABLE `tbl_hoteldetails` (
  `id` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `hotelname` varchar(100) NOT NULL,
  `account` varchar(20) NOT NULL,
  `about` varchar(2500) NOT NULL,
  `nearbyattractions` varchar(1500) NOT NULL,
  `carpark` varchar(20) NOT NULL,
  `gym` varchar(20) NOT NULL,
  `wifi` varchar(20) NOT NULL,
  `restaurent` varchar(20) NOT NULL,
  `laundery` varchar(20) NOT NULL,
  `bar` varchar(20) NOT NULL,
  `ac` varchar(20) NOT NULL,
  `spa` varchar(20) NOT NULL,
  `pool` varchar(20) NOT NULL,
  `playground` varchar(20) NOT NULL,
  `conference` varchar(20) NOT NULL,
  `wheelchair` varchar(20) NOT NULL,
  `amountcharges` int(20) NOT NULL,
  `single` int(11) NOT NULL,
  `doubl` int(11) NOT NULL,
  `family` int(11) NOT NULL,
  `dormitory` int(11) NOT NULL,
  `image` varchar(2500) NOT NULL,
  `maplink` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hoteldetails`
--

INSERT INTO `tbl_hoteldetails` (`id`, `hotelid`, `hotelname`, `account`, `about`, `nearbyattractions`, `carpark`, `gym`, `wifi`, `restaurent`, `laundery`, `bar`, `ac`, `spa`, `pool`, `playground`, `conference`, `wheelchair`, `amountcharges`, `single`, `doubl`, `family`, `dormitory`, `image`, `maplink`) VALUES
(1, 12, 'Raviz', '65446778966', 'The Raviz Resort & Spa Ashtamudi\nJust a short drive away from the busy city of Kollam is The Raviz Resort & Spa, Ashtamudi. The palatial resort, the meandering Ashtamudi Lake and the serene environs is a welcome break from the hustle and bustle of everyday life.\n\nThis idyllic retreat, influenced by the Nalukettu style of architecture is a beautiful amalgam of traditional designs meeting a contemporary presentation. And that is not all, a stay at The Raviz Resort & Spa, Ashtamudi takes you a step closer to nature. Be it a cruise on the lake, or a relaxing traditional spa treatment on the premises, or a glimpse of the rustic village life around the resort, you will find yourself reconnecting with nature.\n\nOne of the best backwater resorts in Kerala, The Raviz Resort & Spa, Ashtamudi offers world-class comforts at the most pristine of locations. Each of the rooms is tailor-made to give you the best of comforts and views that are breathtaking. The restaurant, Keralaeeyam introduces you to flavor-rich and scrumptious authentic Kerala cuisine. The cruise along the Ashtamudi is an experience that will be etched into your minds for a long time. The proximity to the lake also makes the resort a most sought after place for destination weddings', 'Ashtamudi Lake,Light house', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 1200, 2500, 3000, 3500, 3800, 'ravi.jpg', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15766.81041965402!2d76.5780246!3d8.9072156!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa3c6627aae1a66ea!2sThe+Raviz+Resort+and+Spa%2C+Ashtamudi!5e0!3m2!1sen!2sin!4v1554358347357!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>'),
(2, 25, 'Bhramagiri', '67788778992', 'Nestled in the beautiful city of Wayanad. Hotel Brahmagiri Mananthavady 69.8 km from Kannur International Airport and 70.8 km from Mukkali Railway Station.\r\n\r\nAmple conveniences are offered at the hotel to suffice the varying requirements of guests. These includes business centre, outdoor activities, Wi-Fi internet access, sightseeing, travel assistance, front desk, parking and room service. Additionally, airport/railway station transfer and laundry service can be availed by guests on chargeable basis.\r\n\r\n', 'Edakkal Caves, Chembra Peak, Kuruvadweep, Thirunelli Temple, Ambukuthi mala ', 'yes', 'yes', 'yes', 'yes', 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 650, 680, 950, 950, 450, 'hotelbhrama.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotelregister`
--

CREATE TABLE `tbl_hotelregister` (
  `id` int(11) NOT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `typestay` varchar(20) NOT NULL,
  `starrate` varchar(20) NOT NULL,
  `singlerooms` int(30) NOT NULL,
  `doublerooms` int(11) NOT NULL,
  `familyrooms` int(11) NOT NULL,
  `dormitory` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `logid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hotelregister`
--

INSERT INTO `tbl_hotelregister` (`id`, `hotel_name`, `contact_number`, `nationality`, `address`, `street`, `city`, `typestay`, `starrate`, `singlerooms`, `doublerooms`, `familyrooms`, `dormitory`, `email_id`, `hotelid`, `logid`) VALUES
(1, 'backwaterland', '2332233322', 'india', 'ssssss', 'kottiyam', 'Kollam', 'hotel', '3', 10, 8, 5, 0, 'ashimkichu@gmail.com', 2, 11),
(2, 'Raviz', '9995324343', 'india', 'Thevally Bridge, Kollam', 'Kollam', 'Kollam', 'hotel', '5', 25, 20, 0, 0, 'raviz@gmail.com', 4, 12),
(3, 'Peace Homestays', '23456', 'india', 'peace homestays', 'sulthan bathery', 'wayanad', 'homestay', 'nill', 5, 3, 0, 0, 'ashimkichu@gmail.com', 5, 14),
(4, 'Vaithiri Home Stay', '1234568', 'india', 'NH-212, Near Vythiri Town, Vythiri P.O', 'vythiri', 'wayanad', 'homestay', 'nill', 3, 2, 0, 0, 'vaithiri@gmail.com', 6, 20),
(5, 'Bhramagiri', '7736233693', 'India', 'HOTEL BRAHMAGIRI B-STREET,KANNUR ROAD,MANANTHAVADY  WAYANAD KERALA', 'Mananthavady', 'wayanad', 'hotel', '4', 15, 10, 10, 5, 'ashimkichu@gmail.com', 6, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `username`, `password`, `category`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin'),
(2, 'chithrarajappan730@gmail.com', 'chithra', 'foreigner'),
(3, 'ashimkichu@gmail.com', 'ashim', 'native'),
(7, 'ashimkichu@gmail.com', 'qwwqwwq', 'agency'),
(8, 'ashimkichu@gmail.com', '1234567890', 'agency'),
(9, 'ashimkichu@gmail.com', 'qwertyuiop', 'hotel'),
(11, 'ashimkichu@gmail.com', 'ash123', 'hotel'),
(12, 'ashimkichu@gmail.com', 'raviz123', 'hotel'),
(14, 'ashimkichu@gmail.com', 'peace@123', 'homestay'),
(15, 'ashimkichu@gmail.com', 'rozzario@123', 'agency'),
(20, 'vaithiri@gmail.com', 'vaithiri@123', 'homestay'),
(21, 'ashim@gmail.com', 'ashim@12345', 'agency'),
(22, 'ass@gmail.com', 'as12345', 'foreigner'),
(23, 'ashimkichu@gmail.com', 'destination12345', 'agency'),
(24, 'ashimkichu@gmail.com', 'destination@123', 'agency'),
(25, 'ashimkichu@gmail.com', 'bramagiri@123', 'hotel');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_moreplaceimg`
--

CREATE TABLE `tbl_moreplaceimg` (
  `id` int(11) NOT NULL,
  `placename` varchar(100) NOT NULL,
  `moreimge` varchar(1000) NOT NULL,
  `imid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_moreplaceimg`
--

INSERT INTO `tbl_moreplaceimg` (`id`, `placename`, `moreimge`, `imid`) VALUES
(1, 'vagamon', 'v4.jpg', NULL),
(2, 'vagamon', 'v5.jpg', NULL),
(3, 'vagamon', 'v7.jpg', NULL),
(4, 'gavi', 't4.jpg', NULL),
(5, 'gavi', 'w5.jpg', NULL),
(6, 'gavi', 'w6.jpg', NULL),
(7, 'Edakkal Caves', 'banasuradam.jpg', 0),
(8, 'Soochipara Waterfalls', 'kanthanpara.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nativeregister`
--

CREATE TABLE `tbl_nativeregister` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `nationality` varchar(25) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(15) NOT NULL,
  `id_proof` varchar(20) NOT NULL,
  `id_details` varchar(20) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `logid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nativeregister`
--

INSERT INTO `tbl_nativeregister` (`id`, `name`, `contact_number`, `nationality`, `address`, `city`, `state`, `pincode`, `id_proof`, `id_details`, `email_id`, `image`, `logid`) VALUES
(1, 'Ashim n', '9526074513', 'indian', 'Ashik Manzil', 'kollam', 'kerala', '686778', 'adhaar', '98765431224', 'ashimkichu@gmail.com', 'IMG-20180415-WA0015.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

CREATE TABLE `tbl_newsletter` (
  `id` int(11) NOT NULL,
  `offername` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `offervalidity` varchar(20) NOT NULL,
  `lastdate` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `image` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_newsletter`
--

INSERT INTO `tbl_newsletter` (`id`, `offername`, `description`, `offervalidity`, `lastdate`, `contact`, `image`) VALUES
(1, 'honeymoon', '7 day package for couple to enjoy the valentines weak', 'feb-17', 'feb7', 'goanyhere@gmail.com', 'valentines-week.jpg'),
(2, 'valentines week', '7 day package for couple to enjoy the valentines weak', 'feb-14', 'feb7', '987645321', 'valentines-week1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL,
  `packname` varchar(50) NOT NULL,
  `packimage` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`id`, `packname`, `packimage`) VALUES
(1, 'Education', 'friends.jpg'),
(2, 'Honeymoon', 'honeymoon.jpg'),
(3, 'Holiday', 'holiday.jpg'),
(4, 'Group Tour', 'group.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packagebook`
--

CREATE TABLE `tbl_packagebook` (
  `id` int(11) NOT NULL,
  `logid` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(40) NOT NULL,
  `idproof` varchar(10) NOT NULL,
  `agencyid` varchar(10) NOT NULL,
  `packageid` varchar(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_packagebook`
--

INSERT INTO `tbl_packagebook` (`id`, `logid`, `name`, `phone`, `address`, `idproof`, `agencyid`, `packageid`, `date`, `number`) VALUES
(1, '2', 'Chithra Rajappan', '7736118104', 'gdffhg', 'passport', '24', '3', '2019-06-28', 4),
(2, '2', 'Chithra Rajappan', '7736118104', 'gdffhg', 'passport', '8', '1', '2019-06-29', 2),
(3, '3', 'Ashim n', '9526074513', 'Ashik Manzil', 'adhaar', '7', '2', '2019-06-27', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_railway`
--

CREATE TABLE `tbl_railway` (
  `rid` int(11) NOT NULL,
  `railway_station` varchar(50) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_railway`
--

INSERT INTO `tbl_railway` (`rid`, `railway_station`, `sid`) VALUES
(1, 'Bhimavaram Junction railway station', 1),
(2, 'Dharmavaram Junction railway station', 1),
(3, 'Dhone Junction railway station', 1),
(4, 'Gooty Junction railway station', 1),
(5, 'Gudivada Junction railway station', 1),
(6, 'Gudur Junction railway station', 1),
(7, 'Guntakal Junction railway station', 1),
(8, 'Guntur Junction railway station', 1),
(9, 'Kakinada Town railway station', 1),
(10, 'Krishna Canal Junction railway station', 1),
(11, 'Nadikudi railway station', 1),
(12, 'Nandyal railway station', 1),
(13, 'Nidadavolu Junction railway station', 1),
(14, 'Pakala Junction railway station', 1),
(15, 'Penukonda Junction railway station', 1),
(16, 'Renigunta Junction railway station', 1),
(17, 'Samalkot Junction railway station', 1),
(18, 'Tenali Junction railway station', 1),
(19, 'Vijayawada Junction railway station', 1),
(20, 'Murkongselek?', 2),
(21, 'Bhalukpong?', 2),
(22, 'Sealdah', 3),
(23, 'Guwahati ', 3),
(24, 'Dibrugarh', 3),
(25, 'Rangiya Junction ', 3),
(26, 'Kamakhya Junction', 3),
(27, 'Arsikere Junction railway station', 12),
(28, 'Bangalore City railway station', 12),
(29, 'Hubli Junction railway station', 12),
(30, 'Kadur Junction railway station', 12),
(31, 'Krishnarajapuram railway station', 12),
(32, 'Londa Junction railway station', 12),
(33, 'Mangalore Junction railway station', 12),
(34, 'Mysore Junction railway station', 12),
(35, 'Yelahanka Junction railway station', 12),
(36, 'Yesvantpur Junction railway station', 12),
(37, 'Alappuzha', 13),
(38, 'Aluva', 13),
(39, 'Ambalappuzha', 13),
(40, 'Angamaly', 13),
(41, 'Badagara', 13),
(42, 'Bekal Fort', 13),
(43, 'Calicut', 13),
(44, 'Cannanore', 13),
(45, 'Chalakudi', 13),
(46, 'Changanacherry', 13),
(47, 'Charvattur', 13),
(48, 'Chengannur', 13),
(49, 'Chirayinkil', 13),
(50, 'Dhanuvachapuram', 13),
(51, 'Divinenagar', 13),
(52, 'Edappally', 13),
(53, 'Ernakulam Junction', 13),
(54, 'Ernakulam Marshallin', 13),
(55, 'Ernakulam Town', 13),
(56, 'Ettumanur', 13),
(57, 'Ezhimala', 13),
(58, 'Ferok', 13),
(59, 'Guruvayur', 13),
(60, 'Haripad', 13),
(61, 'Irinjalakuda', 13),
(62, 'Kadakavur', 13),
(63, 'Kadalundi', 13),
(64, 'Kanhangad', 13),
(65, 'Kannapuram', 13),
(66, 'Karunagapalli', 13),
(67, 'Kasaragod', 13),
(68, 'Kayamkulam', 13),
(69, 'Kazhakuttam', 13),
(70, 'Kollam Junction', 13),
(71, 'Kotikulam', 13),
(72, 'Kottayam', 13),
(73, 'Koyilandy', 13),
(74, 'Kumbala', 13),
(75, 'Kuttippuram', 13),
(76, 'Manjeshwar', 13),
(77, 'Mararikulam', 13),
(78, 'Mattancheri Hlt', 13),
(79, 'Mavelikara', 13),
(80, 'Mayyanad', 13),
(81, 'Mulanturutti', 13),
(82, 'Munroturuttu', 13),
(83, 'Murukkampuzha', 13),
(84, 'Neyyattinkara', 13),
(85, 'Nileshwar', 13),
(86, 'Ottappalam', 13),
(87, 'Palakkad Town', 13),
(88, 'Palghat', 13),
(89, 'Parassala', 13),
(90, 'Paravur', 13),
(91, 'Parpanangadi', 13),
(92, 'Pattambi', 13),
(93, 'Payangadi', 13),
(94, 'Payyanur', 13),
(95, 'Payyoli', 13),
(96, 'Piravam Road', 13),
(97, 'Pudukad', 13),
(98, 'Punkunnam', 13),
(99, 'Sasthamkotta', 13),
(100, 'Shertalai', 13),
(101, 'Shoranur', 13),
(102, 'Tanur', 13),
(103, 'Tellicherry', 13),
(104, 'Thiruvananthapuram Pettah', 13),
(105, 'Tirunnavaya', 13),
(106, 'Tirur', 13),
(107, 'Tiruvalla', 13),
(108, 'Trichur', 13),
(109, 'Trikarpur', 13),
(110, 'Tripunittura', 13),
(111, 'Trivandrum Central', 13),
(112, 'Trivandrum Kochuveli', 13),
(113, 'Turavur', 13),
(114, 'Uppala', 13),
(115, 'Vaikam Road', 13),
(116, 'Valapattanam', 13),
(117, 'Vallikunnu', 13),
(118, 'Varkala Sivagiri Station', 13),
(119, 'Wadakanchery', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registeragent`
--

CREATE TABLE `tbl_registeragent` (
  `id` int(11) NOT NULL,
  `agent_name` varchar(50) NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `agentregid` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registeragent`
--

INSERT INTO `tbl_registeragent` (`id`, `agent_name`, `agency_name`, `email_id`, `agentregid`, `status`) VALUES
(1, 'zeera Jose', 'qwer', 'chithrarajappan730@gmail.com', 'qwer3454', 0),
(2, 'joy mathew', 'tyuio', 'ashimkichu@gmail.com', 'tyi577', 0),
(5, 'sam alexander', 'h4Hollidays', 'ashimkichu@gmail.com', 'as1123', 1),
(6, 'David', 'Rozzario Travels', 'ashimkichu@gmail.com', 'rozzario2019', 1),
(7, 'shyam', 'Discover Kerala', 'ashimkichu@gmail.com', 'DK12345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registerhotel`
--

CREATE TABLE `tbl_registerhotel` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `hotelregid` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registerhotel`
--

INSERT INTO `tbl_registerhotel` (`id`, `owner_name`, `hotel_name`, `email_id`, `hotelregid`, `status`) VALUES
(1, 'Jacob thomas', 'wonder', 'chithrarajappan90@gmail.com', 'wnd345', 0),
(2, 'Krishna Mohan', 'backwaterland', 'ashimkichu@gmail.com', 'bwl890', 0),
(3, 'aa', 'assa', 'aws@gmm.cc', 'asw221', 0),
(4, 'RaviPillai', 'Raviz', 'ashimkichu@gmail.com', 'rv123', 1),
(5, 'Fahad', 'Peace Homestays', 'ashimkichu@gmail.com', 'Peace@123', 1),
(6, 'Ravi', 'Bhramagiri', 'ashimkichu@gmail.com', 'bhramagiri123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `reviewid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `place` varchar(100) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `logid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`reviewid`, `email`, `name`, `place`, `description`, `logid`) VALUES
(1, 'ashimkichu@gmail.com', 'asdf', 'asdfgh', 'null', 3),
(2, 'chithrarajappan730@gmail.com', 'chithra', 'sdfg', 'null', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `sid` int(11) NOT NULL,
  `sname` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`sid`, `sname`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'HimachalPradesh'),
(10, 'jammu&kashmir'),
(11, 'Jharkhand'),
(12, 'Karnataka'),
(13, 'Kerala'),
(14, 'Madhya Pradesh'),
(15, 'Maharashtra'),
(16, 'Manipur'),
(17, 'Meghalaya'),
(18, 'Mizoram'),
(19, 'Nagaland'),
(20, 'Odisha'),
(21, 'Punjab'),
(22, 'Rajasthan'),
(23, 'Sikkim'),
(24, 'TamilNadu'),
(25, 'Telangana'),
(26, 'Tripura'),
(27, 'Uttarakhand'),
(28, 'UttarPradesh'),
(29, 'WestBengal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_touristplace`
--

CREATE TABLE `tbl_touristplace` (
  `id` int(11) NOT NULL,
  `touristplace` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `district` varchar(30) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `address` varchar(100) NOT NULL,
  `map_link` varchar(500) NOT NULL,
  `nearest_railway` varchar(100) NOT NULL,
  `nearest_bus` varchar(50) NOT NULL,
  `pointof_interest` varchar(100) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_touristplace`
--

INSERT INTO `tbl_touristplace` (`id`, `touristplace`, `state`, `district`, `description`, `address`, `map_link`, `nearest_railway`, `nearest_bus`, `pointof_interest`, `image`) VALUES
(1, 'Munnar', '13', '283', 'Munnar - breathtakingly beautiful - a haven of peace and tranquility - the idyllic tourist destination in God\'s own country. \nMunnar is such a beautiful place in Kerala, which cannot be portrayed in a single canvas. Everything and anything here will make us excited. The hills, the mist, the valleys, the streams, the waterfalls, tea plantations, rare flora and fauna.... It is a beautiful tea town in Idukki district of Kerala easily accessible from Kochi and Coimbatore. The gorgeous hill station is ideally placed in the South Western Ghats of India. With an area of around 557 sq km, Munnar in Devikulam Taluk is the largest panchayat in Kerala.\n\nMunnar got its name from its strategic location at the confluence of three rivers – Muthirapuzha, Nallathanni and Kundala Rivers. \'Moonu\' means \'three\' and \'Aru\' means \'river\'. The region is placed at a height of around 1,500 m to 2,695 m above sea level and was once the summer capital of the British in South India. Later it was developed for cultivating tea plants. The beautiful sights of acres and acres of lush green tea plantations will make us realize that we have at last reached Munnar and of course the place is so much known for its tea estates. It always carries the remnants of history of tea cultivation in Kerala. Neelakurinji or Strobilanthus has special status in the tourism map of this fascinating destination. The flower which blooms once in twelve years attracts lots of tourists from all over the world', 'MunnarKerala 685612\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31425.7992658797!2d77.04666826979549!3d10.08064908892932!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b0799794d099a6d%3A0x63250e5553c7e0c!2sMunnar%2C+Kerala+685612!5e0!3m2!1sen!2sin!4v1554285289347!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Aluva', 'idukki', 'Anamudi,Anamalai Tiger Reserve,Kodaikanal', 'munnar.jpg'),
(2, 'Gavi', '13', '287', 'Gavi is a small village situated in border of Pathanamthitta district and Idukki district which is an Eco-Tourism project promoted by Kerala Forest Development Corporation. This place came to limelight after \'Alistair International\' the world acclaimed tourism major ranked it as leading eco tourism centre and must see place in India. This has caught the attention of tourist and nature lovers from across the world especially from European countries. Gavi is a beautiful, unadulterated and quiet forest haven abundant with carnivorous, herbivorous and omnivorous wildlife. The flora and fauna of this place is loved by nature explorers who can get acquainted with rare plants and herbs. The highly endemic species of the Gymnosperm family like the Nageia Wallichinia or Podocarpus Wallichinia is seen only here. Gavi is home to over 320 species of birds and it attracts Ornithologists from all over the world. Gavi offers adventure tours like trekking, wildlife watching, outdoor camping, night safaris, boating in the reservoir, canoeing and Jeep safari. Tourist can camp in the forest or stay in tree houses and light a bone fire to keep the chill out during the night. The journey to this lovely spot is blanketed by tea plantation along the curvy roads with an eye catching view of the hills, valleys, tropical forests, shoals, beautiful grasslands, cascading waterfalls and cardamom plantations on the way. Tourists are provided with vegetarian food and snacks by restaurants which boost the eco-friendly ambiance of Gavi. Involvement of local and the tribal’s makes Gavi unique and one of its kind in the country and helps to sustain the surrounding in its original state without any modernity. Gavi casts a magical spell on visitors who will remember the experience of this enchanting place for a long time.', '\r\nDistrict	Pathanamthitta district\r\nKerala\r\npin-353464', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31486.530402180924!2d77.14333513675854!3d9.437503802212026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b0658f762eea579%3A0x343b8a48f3b3c7de!2sGavi%2C+Kerala!5e0!3m2!1sen!2sin!4v1552889865918\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Tiruvalla', 'idukki', 'indian elephants near Gavi,Malabar giant squirrel found in Gavi', 'gavi.jpg'),
(3, 'Vagamon', '13', '287', 'Vagamon is a hill station located in Kottayam- Idukki border of Kerala. It has a cool climate with the temperature between 10-23°C during a summer midday. It is situated 1,100 metres above sea level.\n\nVagamon is a tiny plantation township in Central Travancore, Vagamon has an overtone of green. With a never-ending line of lush green hills, breathtaking ravines and meandering rivulets. A perfect tourist place situated 1200 meters above the sea level spot surrounded by the greenery of tea gardens , Fresh cool air, murmuring Pine forest ,small waterfalls , attractive meadows inviting you to vagamon.Reaching Vagamon itself is an extraordinary experience. The meandering road to Vagamon is cut in solid rock lined with pine forests. And as you wind your way through green capped hills, the rolling plains come into view thousands of feet below you.\nVagamon is a tiny plantation township in Central Travancore, Vagamon has an overtone of green. With a never-ending line of lush green hills, breathtaking ravines and meandering rivulets. A perfect tourist place situated 1200 meters above the sea level spot surrounded by the greenery of tea gardens ', 'Vagamon, Kerala 685503', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62929.527328646014!2d76.86848334822069!3d9.67288472736376!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b07b486067afccb%3A0xe78789cc4d9eabb9!2sVagamon%2C+Kerala!5e0!3m2!1sen!2sin!4v1552892121499\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Kottayam', 'Erattupetta', 'Vagamon Kurishumala Church,Thangalpara,Vagamon Hills', 'vagamon.jpg'),
(4, 'Paris', '10', '198', 'Paris, France\'s capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine.', 'France\r\nRegion	Île-de-France\r\nDepartment	Paris', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d167998.10803373056!2d2.206977064368058!3d48.858774103123785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!5e0!3m2!1sen!2sin!4v1552893146267\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Charvattur', 'fdsg', 'Eiffel Tower,Louvre Museum,Cathédrale Notre-Dame de Paris', 'p1.jpg'),
(5, 'Idukki Dam', '13', '283', 'The Idukki Dam is a double curvature Arch dam constructed across the Periyar River in a narrow gorge between two granite hills locally known as Kuravan and Kurathi in Kerala, India. At 168.91 metres, it is one of the highest arch dams in Asia. It is constructed and owned by the Kerala State Electricity Board.', 'Cheruthony, Idukki Twp, Kerala 685602', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2097.9906800097665!2d76.9750516948374!3d9.843792173083296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b07ba9202455555%3A0x29d5eb6342932e07!2sIdukki+Dam!5e1!3m2!1sen!2sin!4v1556092927272!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Aluva', 'idukki', 'idukki wildlife sanctury, arch dam', 'idukki.jpg'),
(6, 'Edakkal Caves', '13', '294', 'Edakkal Caves are two natural caves at a remote location at Edakkal, 25 km from Kalpetta in the Wayanad district of Kerala in India\'s Western Ghats. They lie 1,200 m above sea level on Ambukutty Mala, near an ancient trade route connecting the high mountains of Mysore to the ports of the Malabar coast. Twenty five kilometers away from Kalpetta lays two caves which showcases nature?s skill and philosophy on architecture. These caves are located 1,200 m above the sea level on Ambukutty Mala. The name ?Edakkal? literally means ?a stone in between?. Here you can see a cave formed by a heavy boulder straddling a fissure in the rock.\r\n\r\nMany legends are there behind the formation of Edakkal caves. One of the stories is that, these caves are said to be formed with the arrows fired by Lava and Kusha, the sons of Lord Sri Rama. Another one is associated with Kutti Chathan and the Goddess Mudiampilly. The local people used to have a pilgrimage trip to this place to honour the Goddess.', 'Nenmeni, Kerala 673595', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3907.9509469115237!2d76.23208031429323!3d11.626845946100602!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba60f22c50570e3%3A0xdb71297693a9e0df!2sEdakkal+Caves!5e0!3m2!1sen!2sin!4v1560144707047!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '0', 'kalpetta', 'Soochipara Waterfalls, BanasuraSagar Dam', 'Edakkal-Caves.jpg'),
(7, 'Soochipara Waterfalls', '13', '294', 'Soochipara Falls also known as Sentinel Rock Waterfalls is a three-tiered waterfall in Vellarimala, Wayanad, India. It is surrounded by deciduous, evergreen and montane forests\r\n\r\nSoochipara waterfall is a three tiered waterfall at Vellarimala in Wayanad. This waterfall, surrounded by dense green forest, is also known as Sentinel Rock Waterfall. A 20 minute drive from Meppadi in Wayanad will take you to this splendid waterfall. The name Soochipara derived from the words ?soochi? and ?para? means ?rock? and ?needle?. The name given is apt as you can see needle shaped rock here.\r\n\r\nYou have to walk around 2 km to reach the waterfall, where vehicles can?t move further. You have to pay a nominal fee for entrance and camera. From the entrance you need to descend down to reach the falls. The water here cascades down from a height of 100 to 200 ft and this waterfall is an ideal place for trekking and rock climbing. You can sight a pool beneath this falls and here you can go for swimming and bathing.\r\n\r\nBest time to visit Soochipara waterfall is during monsoon season as you can see the waterfall at its fullest. The destination is well connected to nearby places. So, you will not find any difficulty to reach here.', 'Vellarimala, Kerala 673577', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15638.270864071841!2d76.15544775135369!3d11.511074632693907!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba6126f0827c0cb%3A0x8a1abfcbeda16c6f!2sSoochipara+Waterfalls!5e0!3m2!1sen!2sin!4v1560145174177!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '0', 'Vellarimala', 'Neelimala view point, Kanthanpara Waterfalls', 'soochipara.jpg'),
(8, 'Kuruvadweep', '13', '294', 'Kuruvadweep or Kuruva Island is a 950-acre protected river delta. It comprises three densely wooded uninhabited islands and a few submergible satellite islands, which lies on the banks of the tributaries of Kabini River in the Wayanad district, Kerala, India\r\n\r\nThese islands consists of dense and evergreen forest that is uninhabited and hence home to rare kinds of flora and fauna: endemic species of birds, orchids and herbs namely. Its unique geographical characteristics make it a place where not only the leaves but also silence is evergreen. Its 16.7 km from the nearest town itself and thus it has become a place of attraction. Recently, it has been named as the most visited place in the district by tourists from all over the globe.\r\n\r\nThe island surrounded by streams and river is accessible by rafts or fiber boats run by Kerala Tourism Department. Entrance to the island is restricted and monitored by the Forest Department of Kerala, initiative to protect forest. Due the sheer number of elephants and other animals in the island, a pass has to be obtained prior to the visit, from Dept of Forest is mandatory. The best time to visit Kuruvadeep is from mid December to late April. Kuruvadweep is usually closed to the public from May last to early December, due to the monsoons. The torrential rainfall floods the streams and the water level rises dangerously high.\r\n\r\nKuruva Islands is 17 km east of Mananthavady and 10 km north west of Pulpally, nearby towns in Wayanad District. More details can be sought in district office of Department of Tourism, Wayanad in Kalpetta. The island is located very close to the state border of Karnataka.', ' Wayanad, Kerala', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31241.553841544708!2d76.07471237079858!3d11.821666263510656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba5e753ef935e3b%3A0xab46e33b236052a0!2sKuruvadweep!5e0!3m2!1sen!2sin!4v1560146087996!5m2!1sen!2sin\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '0', 'Mananthavady', 'Bandipur tiger Reserve, Wayanad Wildlife Sanctury', 'Kuruva-Island.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` int(11) NOT NULL,
  `fromid` int(11) NOT NULL,
  `fromaccount` varchar(20) NOT NULL,
  `toid` int(11) NOT NULL,
  `toaccount` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `bookingdate` varchar(50) NOT NULL,
  `bookingid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `fromid`, `fromaccount`, `toid`, `toaccount`, `amount`, `bookingdate`, `bookingid`) VALUES
(1, 2, '157913579', 25, '67788778992', 4450, '2019-06-10 15:01:55', '1'),
(2, 3, '123456789', 12, '65446778966', 11700, '2019-06-10 15:22:44', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactionpack`
--

CREATE TABLE `tbl_transactionpack` (
  `id` int(11) NOT NULL,
  `fromid` varchar(10) NOT NULL,
  `fromaccount` varchar(20) NOT NULL,
  `toid` varchar(10) NOT NULL,
  `toaccount` varchar(20) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `bookingdate` varchar(20) NOT NULL,
  `bookingid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transactionpack`
--

INSERT INTO `tbl_transactionpack` (`id`, `fromid`, `fromaccount`, `toid`, `toaccount`, `amount`, `bookingdate`, `bookingid`) VALUES
(1, '2', '157913579', '24', '5667677675', '50000', '2019-06-10 15:10:23', 1),
(2, '2', '157913579', '8', '6778767789', '14000', '2019-06-10 15:20:42', 2),
(3, '3', '123456789', '7', '9876788990', '13500', '2019-06-10 15:23:43', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_agencyregister`
--
ALTER TABLE `tbl_agencyregister`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logid` (`logid`),
  ADD KEY `agencyid` (`agencyid`);

--
-- Indexes for table `tbl_agentoffers`
--
ALTER TABLE `tbl_agentoffers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_agentpackages`
--
ALTER TABLE `tbl_agentpackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packageid` (`packageid`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `tbl_blogcomment`
--
ALTER TABLE `tbl_blogcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogid` (`blogid`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logid` (`logid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`did`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `tbl_foreignerregister`
--
ALTER TABLE `tbl_foreignerregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_homestaydetails`
--
ALTER TABLE `tbl_homestaydetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `tbl_hoteldetails`
--
ALTER TABLE `tbl_hoteldetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `tbl_hotelregister`
--
ALTER TABLE `tbl_hotelregister`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotelid` (`hotelid`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_moreplaceimg`
--
ALTER TABLE `tbl_moreplaceimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nativeregister`
--
ALTER TABLE `tbl_nativeregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_packagebook`
--
ALTER TABLE `tbl_packagebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `tbl_railway`
--
ALTER TABLE `tbl_railway`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `did` (`sid`);

--
-- Indexes for table `tbl_registeragent`
--
ALTER TABLE `tbl_registeragent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_registerhotel`
--
ALTER TABLE `tbl_registerhotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`reviewid`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `sid_2` (`sid`);

--
-- Indexes for table `tbl_touristplace`
--
ALTER TABLE `tbl_touristplace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromid` (`fromid`),
  ADD KEY `toid` (`toid`),
  ADD KEY `bookingid` (`bookingid`);

--
-- Indexes for table `tbl_transactionpack`
--
ALTER TABLE `tbl_transactionpack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromid` (`fromid`,`toid`,`bookingid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_agencyregister`
--
ALTER TABLE `tbl_agencyregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_agentoffers`
--
ALTER TABLE `tbl_agentoffers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_agentpackages`
--
ALTER TABLE `tbl_agentpackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_blog`
--
ALTER TABLE `tbl_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_blogcomment`
--
ALTER TABLE `tbl_blogcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;
--
-- AUTO_INCREMENT for table `tbl_foreignerregister`
--
ALTER TABLE `tbl_foreignerregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_homestaydetails`
--
ALTER TABLE `tbl_homestaydetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_hoteldetails`
--
ALTER TABLE `tbl_hoteldetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_hotelregister`
--
ALTER TABLE `tbl_hotelregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_moreplaceimg`
--
ALTER TABLE `tbl_moreplaceimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_nativeregister`
--
ALTER TABLE `tbl_nativeregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_packagebook`
--
ALTER TABLE `tbl_packagebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_railway`
--
ALTER TABLE `tbl_railway`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `tbl_registeragent`
--
ALTER TABLE `tbl_registeragent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_registerhotel`
--
ALTER TABLE `tbl_registerhotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tbl_touristplace`
--
ALTER TABLE `tbl_touristplace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_transactionpack`
--
ALTER TABLE `tbl_transactionpack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_agencyregister`
--
ALTER TABLE `tbl_agencyregister`
  ADD CONSTRAINT `tbl_agencyregister_ibfk_2` FOREIGN KEY (`logid`) REFERENCES `tbl_login` (`id`),
  ADD CONSTRAINT `tbl_agencyregister_ibfk_3` FOREIGN KEY (`agencyid`) REFERENCES `tbl_registeragent` (`id`);

--
-- Constraints for table `tbl_blogcomment`
--
ALTER TABLE `tbl_blogcomment`
  ADD CONSTRAINT `tbl_blogcomment_ibfk_1` FOREIGN KEY (`blogid`) REFERENCES `tbl_blog` (`id`);

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_ibfk_1` FOREIGN KEY (`logid`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_booking_ibfk_2` FOREIGN KEY (`hotelid`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD CONSTRAINT `tbl_district_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `tbl_state` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_foreignerregister`
--
ALTER TABLE `tbl_foreignerregister`
  ADD CONSTRAINT `tbl_foreignerregister_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_login` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nativeregister`
--
ALTER TABLE `tbl_nativeregister`
  ADD CONSTRAINT `tbl_nativeregister_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_login` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_railway`
--
ALTER TABLE `tbl_railway`
  ADD CONSTRAINT `tbl_railway_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `tbl_state` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_1` FOREIGN KEY (`logid`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`fromid`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaction_ibfk_2` FOREIGN KEY (`toid`) REFERENCES `tbl_login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
