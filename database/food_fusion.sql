-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2025 at 07:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_fusion`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(1, 'suyiko', 'sunadikyaw7733@gmail.com', 'NA', '2025-08-01 20:06:28'),
(2, 'suyiko', 'suyiko@gmail.com', 'NA', '2025-08-01 23:39:03'),
(3, 'suyiko', 'suyiko@gmail.com', 'NA', '2025-08-02 00:05:40'),
(4, 'suyiko', 'suyiko@gmail.com', 'NA', '2025-08-12 18:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `cookbook`
--

CREATE TABLE `cookbook` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookbook`
--

INSERT INTO `cookbook` (`id`, `user_id`, `title`, `description`, `image`, `created_at`) VALUES
(7, 8, 'Sparkling Strawberry Lemonade', '🍹 Sparkling Strawberry Lemonade – A Summer Tradition Shared\r\nStrawberry lemonade is a favorite in many corners of the world, bringing people together with its balance of sweet and tangy flavors. It’s the kind of drink you’ll find at community fairs, family picnics, and summer gatherings where laughter fills the air. Fresh strawberries add a burst of color, while lemon keeps it bright and refreshing—perfect for sharing with friends, neighbors, and anyone who loves the taste of summer in a glass.', '1755402906_Sparkling Strawberry Lemonade.jpg', '2025-08-17 03:55:06'),
(8, 8, 'Norwegian Salmon with Dill Sauce', '“While traveling through Norway, I discovered the joy of fresh, local salmon served with a simple yet flavorful dill sauce. The dish was a perfect reflection of the country’s clean, natural flavors and its love for fresh ingredients. I tried to recreate it at home, and every bite reminds me of fjords, cozy seaside towns, and the warm hospitality of the locals. Sharing it here so the FoodFusion community can experience a little taste of Norway!”', '1755404894_Norwegian Salmon with Dill Sauce.jpg', '2025-08-17 04:28:14'),
(10, 8, 'Hidden Gem in Florence', '“While wandering through the charming streets of Florence, I discovered Trattoria Da Marco, a small family-run restaurant that felt like a true local treasure. The pasta here was incredible—fresh, perfectly cooked, and bursting with flavor in every bite. I tried their wild mushroom tagliatelle, and it instantly became one of the best dishes I’ve ever tasted. The cozy atmosphere, the friendly staff, and the way locals kept coming back made the experience unforgettable. I’m sharing this spot with the FoodFusion community so everyone can enjoy a taste of authentic Florence, where every dish tells a story and leaves you wanting more.”', '1755405694_italy.jpg', '2025-08-17 04:41:34'),
(11, 8, 'A Taste of Norway by the Water', '“During my trip along the Norwegian fjords, I stumbled upon Fjord Café, a cozy spot right by the water. The highlight was their fresh seafood platter—perfectly cooked salmon, tender shrimp, and locally sourced scallops that tasted like they had just come from the fjord. The view of the calm waters and surrounding mountains made the meal even more magical. The staff were warm and welcoming, sharing tips about local ingredients and cooking traditions. I’m sharing this gem with the FoodFusion community so everyone can discover a place where amazing food meets breathtaking Norwegian scenery.”', '1755406090_norway.jpg', '2025-08-17 04:48:10'),
(14, 8, 'Discovering Sweden’s Culinary Charm at Sturehof', '\"During my visit to Stockholm, I had the pleasure of dining at Sturehof, a renowned seafood restaurant located in the heart of the city. Established in 1897, Sturehof has been serving exquisite seafood and shellfish dishes for over a century. The ambiance exudes a blend of tradition and modernity, with its elegant interiors and bustling atmosphere.\r\n\r\nI indulged in their classic Swedish dishes, including the famous Swedish meatballs and a variety of fresh seafood platters. Each bite was a testament to the rich culinary heritage of Sweden, showcasing the finest local ingredients prepared with expertise and passion.\"', '1755408648_sweden.jpg', '2025-08-17 05:30:48'),
(15, 8, 'A Steak Adventure', '“I recently decided to try something I’d only seen on the internet—Salt Bae’s famous steak salting technique. I steamed a tender piece of beef and prepared it just right, then sprinkled salt with the dramatic flair that made him famous. It was a fun experiment, and even though my technique wasn’t perfect, the beef tasted amazing and it felt like I was bringing a little bit of internet magic into my kitchen. Sharing this with the FoodFusion community so everyone can try a playful cooking experiment, have fun with presentation, and enjoy delicious beef at the same time!”', '1755408726_Nusret Gökçe.jpg', '2025-08-17 05:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_likes`
--

CREATE TABLE `cookbook_likes` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cookbook_likes`
--

INSERT INTO `cookbook_likes` (`id`, `recipe_id`, `created_at`) VALUES
(14, 7, '2025-08-17 03:58:46'),
(18, 10, '2025-08-17 04:42:49'),
(19, 11, '2025-08-17 04:48:45'),
(20, 11, '2025-08-17 04:48:46'),
(22, 8, '2025-08-17 05:15:23'),
(23, 14, '2025-08-17 05:35:47'),
(24, 15, '2025-08-17 16:18:22'),
(25, 15, '2025-08-17 16:19:12'),
(26, 15, '2025-08-17 16:19:13'),
(27, 15, '2025-08-17 16:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cuisine_type` varchar(50) DEFAULT NULL,
  `dietary_preference` varchar(50) DEFAULT NULL,
  `difficulty` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_community` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `description`, `image`, `cuisine_type`, `dietary_preference`, `difficulty`, `created_at`, `is_community`) VALUES
(1, 'Spicy Thai Noodles', 'A flavorful dish packed with heat and herbs.', 'recipe1.jpg', 'Thai', 'Vegetarian', 'Medium', '2025-07-29 14:44:47', 0),
(2, 'Vegan Chickpea Curry', 'Plant-based comfort food with bold spices.', 'recipe2.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 14:44:47', 0),
(3, 'Rustic Apple Tart', 'A sweet ending to any meal. Homemade pastry with fresh apples.', 'recipe3.jpg', 'French', 'Vegetarian', 'Medium', '2025-07-29 14:44:47', 0),
(4, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts and vegetables.', 'Kung Pao Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(5, 'Sweet and Sour Pork', 'Pork cooked in a sweet and tangy sauce.', 'Sweet and Sour Pork.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(6, 'Mapo Tofu', 'Tofu in a spicy Sichuan sauce.', 'Mapo Tofu.jpg', 'Chinese', 'Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(7, 'Chow Mein', 'Stir-fried noodles with vegetables and meat.', 'Chow Mein.jpg', 'Chinese', 'Non-Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(8, 'Spring Rolls', 'Crispy rolls filled with veggies or meat.', 'Spring Rolls.jpg', 'Chinese', 'Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(9, 'Fried Rice', 'Chinese-style fried rice with vegetables and meat.', 'Fried Rice.jpg', 'Chinese', 'Non-Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(10, 'Dumplings', 'Chinese dumplings filled with meat and vegetables.', 'Dumplings.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(11, 'Beef and Broccoli', 'Stir-fried beef and broccoli in savory sauce.', 'Beef and Broccoli.jpg', 'Chinese', 'Non-Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(12, 'Hot and Sour Soup', 'Spicy and tangy soup with mushrooms and tofu.', 'Hot and Sour Soup.jpg', 'Chinese', 'Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(13, 'Egg Foo Young', 'Chinese-style omelette with vegetables and meat.', 'Egg Foo Young.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(14, 'Lo Mein', 'Soft noodles stir-fried with vegetables and sauce.', 'Lo Mein.jpg', 'Chinese', 'Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(15, 'General Tso\'s Chicken', 'Sweet and spicy crispy chicken dish.', 'General Tso\'s Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(16, 'Sesame Chicken', 'Crispy chicken tossed in sweet sesame sauce.', 'Sesame Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(17, 'Steamed Buns', 'Soft buns with savory fillings.', 'Steamed Buns.jpg', 'Chinese', 'Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(18, 'Char Siu', 'Chinese barbecued pork.', 'Char Siu.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(19, 'Chinese Cabbage Stir-Fry', 'Simple and healthy vegetable dish.', 'Chinese Cabbage Stir-Fry.jpg', 'Chinese', 'Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(20, 'Sichuan Chicken', 'Hot and numbing chicken dish.', 'Sichuan Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(21, 'Wonton Soup', 'Clear soup with wontons.', 'Wonton Soup.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(22, 'Chinese Eggplant in Garlic Sauce', 'Savory and spicy eggplant dish.', 'Chinese Eggplant in Garlic Sauce.jpg', 'Chinese', 'Vegan', 'Medium', '2025-07-29 06:53:27', 0),
(23, 'Peking Duck', 'Crispy-skinned roasted duck.', 'Peking Duck.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(24, 'Salt and Pepper Tofu', 'Crispy tofu with salt and pepper seasoning.', 'Salt and Pepper Tofu.jpg', 'Chinese', 'Vegan', 'Easy', '2025-07-29 06:53:27', 0),
(25, 'Crab Rangoon', 'Crispy wontons with cream cheese filling.', 'Crab Rangoon.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(26, 'Chinese Scallion Pancakes', 'Savory pancakes with green onions.', 'Chinese Scallion Pancakes.jpg', 'Chinese', 'Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(27, 'Orange Chicken', 'Sweet and tangy crispy chicken.', 'Orange Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(28, 'Lion’s Head Meatballs', 'Giant pork meatballs in broth.', 'Lion’s Head Meatballs.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(29, 'Egg Drop Soup', 'Silky egg soup.', 'Egg Drop Soup.jpg', 'Chinese', 'Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(30, 'Twice-Cooked Pork', 'Pork belly cooked and stir-fried with sauce.', 'Twice Cooked Pork.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(31, 'Chinese Green Beans', 'Stir-fried string beans with garlic.', 'Chinese Green Beans.jpg', 'Chinese', 'Vegan', 'Easy', '2025-07-29 06:53:27', 0),
(32, 'Beef Chow Fun', 'Wide rice noodles with beef and vegetables.', 'Beef Chow Fun.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(33, 'Chinese Lemon Chicken', 'Fried chicken with lemon sauce.', 'Chinese Lemon Chicken.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(34, 'Tofu and Vegetable Stir-Fry', 'Healthy stir-fry with tofu and vegetables.', 'Tofu and Vegetable Stir-Fry.jpg', 'Chinese', 'Vegan', 'Easy', '2025-07-29 06:53:27', 0),
(35, 'Sticky Rice in Lotus Leaf', 'Sticky rice with fillings wrapped in lotus leaf.', 'Sticky Rice in Lotus Leaf.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(36, 'Chinese Spare Ribs', 'Tender ribs in savory sauce.', 'Chinese Spare Ribs.jpg', 'Chinese', 'Non-Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(37, 'Glass Noodle Salad', 'Refreshing cold noodle salad.', 'Glass Noodle Salad.jpg', 'Chinese', 'Vegan', 'Easy', '2025-07-29 06:53:27', 0),
(38, 'Sichuan Cold Noodles', 'Spicy and tangy cold noodles.', 'Sichuan Cold Noodles.jpg', 'Chinese', 'Vegan', 'Medium', '2025-07-29 06:53:27', 0),
(39, 'Eggplant and Tofu Hotpot', 'Hearty hotpot dish.', 'Eggplant and Tofu Hotpot.jpg', 'Chinese', 'Vegetarian', 'Hard', '2025-07-29 06:53:27', 0),
(40, 'Beef Tomato Stir-Fry', 'Quick beef stir-fried with tomato.', 'Beef Tomato StirFry.jpg', 'Chinese', 'Non-Vegetarian', 'Easy', '2025-07-29 06:53:27', 0),
(41, 'Chinese Cucumber Salad', 'Cold and refreshing side dish.', 'Chinese Cucumber Salad.jpg', 'Chinese', 'Vegan', 'Easy', '2025-07-29 06:53:27', 0),
(42, 'Tangerine Beef', 'Sweet citrus beef stir-fry.', 'Tangerine Beef.jpg', 'Chinese', 'Non-Vegetarian', 'Medium', '2025-07-29 06:53:27', 0),
(43, 'Butter Chicken', 'Creamy tomato-based chicken curry.', 'Butter Chicken.jpg', 'Indian', 'Non-Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(44, 'Paneer Butter Masala', 'Paneer cubes in rich buttery gravy.', 'Paneer Butter Masala.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(45, 'Biryani', 'Spiced rice with meat or vegetables.', 'Biryani.jpg', 'Indian', 'Non-Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(46, 'Chole Bhature', 'Spicy chickpeas with fried bread.', 'Chole Bhature.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(47, 'Samosa', 'Deep-fried pastry with spicy filling.', 'Samosa.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(48, 'Dal Makhani', 'Slow-cooked lentils in creamy sauce.', 'Dal Makhani.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(49, 'Masala Dosa', 'Crispy rice crepe filled with spiced potatoes.', 'Masala Dosa.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(50, 'Rogan Josh', 'Slow-cooked Kashmiri lamb curry.', 'Rogan Josh.jpg', 'Indian', 'Non-Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(51, 'Palak Paneer', 'Spinach gravy with cottage cheese cubes.', 'Palak Paneer.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(52, 'Aloo Gobi', 'Spiced potato and cauliflower dish.', 'Aloo Gobi.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(53, 'Tandoori Chicken', 'Spiced grilled chicken from clay oven.', 'Tandoori Chicken.jpg', 'Indian', 'Non-Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(54, 'Baingan Bharta', 'Smoky mashed eggplant dish.', 'Baingan Bharta.jpg', 'Indian', 'Vegan', 'Medium', '2025-07-29 06:57:47', 0),
(55, 'Pav Bhaji', 'Mashed vegetable curry with bread rolls.', 'Pav Bhaji.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(56, 'Rajma', 'Kidney beans in thick gravy.', 'Rajma.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(57, 'Fish Curry', 'Coastal-style spicy fish gravy.', 'Fish Curry.jpg', 'Indian', 'Non-Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(58, 'Chicken Tikka Masala', 'Grilled chicken in creamy sauce.', 'Chicken Tikka Masala.jpg', 'Indian', 'Non-Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(59, 'Vegetable Korma', 'Mild curry with mixed vegetables.', 'Vegetable Korma.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(60, 'Kofta Curry', 'Spiced balls of meat or veggies in curry.', 'Kofta Curry.jpg', 'Indian', 'Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(61, 'Hyderabadi Biryani', 'Fragrant rice with marinated meat.', 'Hyderabadi Biryani.jpg', 'Indian', 'Non-Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(62, 'Idli Sambhar', 'Steamed rice cakes with lentil stew.', 'Idli Sambhar.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(63, 'Mutter Paneer', 'Green peas and paneer in curry.', 'Mutter Paneer.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(64, 'Bhindi Masala', 'Spiced okra stir-fry.', 'Bhindi Masala.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(65, 'Kadai Paneer', 'Paneer cooked with capsicum and spices.', 'Kadai Paneer.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(66, 'Chicken Chettinad', 'Fiery South Indian chicken curry.', 'Chicken Chettinad.jpg', 'Indian', 'Non-Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(67, 'Vegetable Pulao', 'Fragrant rice cooked with vegetables.', 'Vegetable Pulao.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(68, 'Tamarind Rice', 'Tangy rice dish from South India.', 'Tamarind Rice.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(69, 'Pesarattu', 'Green gram dosa with ginger and green chili.', 'Pesarattu.jpg', 'Indian', 'Vegan', 'Medium', '2025-07-29 06:57:47', 0),
(70, 'Chicken 65', 'Spicy deep-fried chicken starter.', 'Chicken 65.jpg', 'Indian', 'Non-Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(71, 'Dhokla', 'Steamed savory cake from Gujarat.', 'Dhokla.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(72, 'Naan', 'Leavened tandoor-baked bread.', 'Naan.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(73, 'Malai Kofta', 'Fried balls in creamy gravy.', 'Malai Kofta.jpg', 'Indian', 'Vegetarian', 'Hard', '2025-07-29 06:57:47', 0),
(74, 'Litti Chokha', 'Bihar special stuffed dough balls with mashed veggies.', 'Litti Chokha.jpg', 'Indian', 'Vegan', 'Medium', '2025-07-29 06:57:47', 0),
(75, 'Appam with Stew', 'Soft hoppers with mild coconut stew.', 'Appam with Stew.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(76, 'Chana Masala', 'Spicy chickpea curry.', 'Chana Masala.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(77, 'Kadhi Pakora', 'Yogurt curry with gram flour fritters.', 'Kadhi Pakora.jpg', 'Indian', 'Vegetarian', 'Medium', '2025-07-29 06:57:47', 0),
(78, 'Poha', 'Flattened rice cooked with turmeric and veggies.', 'Poha.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(79, 'Upma', 'Semolina savory porridge.', 'Upma.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(80, 'Masala Chai', 'Indian spiced tea.', 'Masala Chai.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(81, 'Kesari Bath', 'Sweet semolina dessert.', 'Kesari Bath.jpg', 'Indian', 'Vegetarian', 'Easy', '2025-07-29 06:57:47', 0),
(82, 'Rasam', 'Tangy South Indian soup.', 'Rasam.jpg', 'Indian', 'Vegan', 'Easy', '2025-07-29 06:57:47', 0),
(83, 'Spaghetti Carbonara', 'Classic Roman pasta with egg, cheese, and pancetta.', 'Spaghetti Carbonara.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(84, 'Margherita Pizza', 'Simple pizza with tomatoes, mozzarella, and basil.', 'Margherita Pizza.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(85, 'Lasagna', 'Layered pasta with meat sauce and béchamel.', 'Lasagna.jpg', 'Italian', 'Non-Vegetarian', 'Hard', '2025-07-29 07:00:14', 0),
(86, 'Fettuccine Alfredo', 'Pasta with a rich cream and cheese sauce.', 'Fettuccine Alfredo.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(87, 'Risotto alla Milanese', 'Creamy risotto with saffron.', 'Risotto alla Milanese.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(88, 'Gnocchi', 'Soft potato dumplings served with sauce.', 'Gnocchi.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(89, 'Pasta Primavera', 'Pasta with fresh seasonal vegetables.', 'Pasta Primavera.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(90, 'Tiramisu', 'Coffee-flavored layered dessert.', 'Tiramisu.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(91, 'Panzanella', 'Tuscan bread salad with tomatoes and basil.', 'Panzanella.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(92, 'Arancini', 'Fried rice balls with fillings.', 'Arancini.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(93, 'Osso Buco', 'Braised veal shanks with vegetables.', 'Osso Buco.jpg', 'Italian', 'Non-Vegetarian', 'Hard', '2025-07-29 07:00:14', 0),
(94, 'Minestrone', 'Hearty vegetable soup with beans and pasta.', 'Minestrone.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(95, 'Bruschetta', 'Grilled bread with tomatoes and olive oil.', 'Bruschetta.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(96, 'Caprese Salad', 'Tomatoes, mozzarella, and basil.', 'Caprese Salad.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(97, 'Ravioli', 'Stuffed pasta pockets with cheese or meat.', 'Ravioli.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(98, 'Polenta', 'Creamy cornmeal porridge.', 'Polenta.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(99, 'Stuffed Shells', 'Pasta shells filled with cheese and baked.', 'Stuffed Shells.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(100, 'Bolognese Sauce', 'Rich meat sauce served with pasta.', 'Bolognese Sauce.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(101, 'Eggplant Parmesan', 'Fried eggplant layered with cheese and sauce.', 'Eggplant Parmesan.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(102, 'Tortellini', 'Ring-shaped stuffed pasta.', 'Tortellini.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(103, 'Cannelloni', 'Tube pasta stuffed with meat or cheese.', 'Cannelloni.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(104, 'Pasta Puttanesca', 'Pasta with olives, capers, and tomatoes.', 'Pasta Puttanesca.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(105, 'Italian Wedding Soup', 'Broth with meatballs and greens.', 'Italian Wedding Soup.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(106, 'Saltimbocca', 'Veal with prosciutto and sage.', 'Saltimbocca.jpg', 'Italian', 'Non-Vegetarian', 'Hard', '2025-07-29 07:00:14', 0),
(107, 'Pasta e Fagioli', 'Pasta with beans and tomato broth.', 'Pasta e Fagioli.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(108, 'Pesto Pasta', 'Pasta tossed in basil pesto sauce.', 'Pesto Pasta.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(109, 'Focaccia', 'Flat oven-baked bread with olive oil.', 'Flat oven-baked bread with olive oil.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(110, 'Zuppa Toscana', 'Creamy soup with sausage and kale.', 'Creamy soup with sausage and kale.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(111, 'Chicken Piccata', 'Chicken with lemon and capers.', 'Chicken with lemon and capers.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(112, 'Calzone', 'Folded pizza with cheese and fillings.', 'Folded pizza with cheese and fillings.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(113, 'Panna Cotta', 'Chilled dessert with cream and gelatin.', 'Chilled dessert with cream and gelatin.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(114, 'Baked Ziti', 'Pasta baked with tomato sauce and cheese.', 'Pasta baked with tomato sauce and cheese.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(115, 'Italian Meatballs', 'Spiced ground meat balls in sauce.', 'Spiced ground meat balls in sauce.jpg', 'Italian', 'Non-Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(116, 'Ricotta Gnocchi', 'Soft gnocchi made with ricotta cheese.', 'Soft gnocchi made with ricotta cheese.jpg', 'Italian', 'Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(117, 'Clam Linguine', 'Linguine pasta with clams in white wine sauce.', 'Linguine pasta with clams in white wine sauce.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(118, 'Caponata', 'Sicilian eggplant dish with sweet-sour flavors.', 'Sicilian eggplant dish with sweet-sour flavors.jpg', 'Italian', 'Vegan', 'Medium', '2025-07-29 07:00:14', 0),
(119, 'Spaghetti Aglio e Olio', 'Pasta with garlic and olive oil.', 'Pasta with garlic and olive oil.jpg', 'Italian', 'Vegan', 'Easy', '2025-07-29 07:00:14', 0),
(120, 'Italian Sausage Risotto', 'Creamy rice with sausage and parmesan.', 'Creamy rice with sausage and parmesan.jpg', 'Italian', 'Non-Vegetarian', 'Medium', '2025-07-29 07:00:14', 0),
(121, 'Prosciutto-Wrapped Melon', 'Sweet melon wrapped in cured ham.', 'Sweet melon wrapped in cured ham.jpg', 'Italian', 'Non-Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(122, 'Amaretti Cookies', 'Crunchy almond-flavored cookies.', 'Crunchy almond-flavored cookie.jpg', 'Italian', 'Vegetarian', 'Easy', '2025-07-29 07:00:14', 0),
(123, 'Tacos al Pastor', 'Tacos filled with marinated pork and pineapple.', 'Tacos filled with marinated pork and pineapple.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(124, 'Guacamole', 'Creamy avocado dip with lime, onion, and cilantro.', 'Creamy avocado dip with lime, onion, and cilantro.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(125, 'Chiles Rellenos', 'Stuffed peppers fried in egg batter.', 'Stuffed peppers fried in egg batter.jpg', 'Mexican', 'Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(126, 'Quesadillas', 'Grilled tortillas filled with cheese and other ingredients.', 'Grilled tortillas filled with cheese and other ing.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(127, 'Tamales', 'Corn dough stuffed with meat or vegetables, steamed in husks.', 'Corn dough stuffed with meat or vegetables, steame.jpg', 'Mexican', 'Non-Vegetarian', 'Hard', '2025-07-29 07:04:39', 0),
(128, 'Enchiladas', 'Tortillas rolled around filling and covered with sauce.', 'Tortillas rolled around filling and covered with s.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(129, 'Chilaquiles', 'Fried tortilla chips simmered in sauce.', 'Fried tortilla chips simmered in sauce.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(130, 'Pozole', 'Hearty soup made with hominy and pork.', 'Hearty soup made with hominy and pork.jpg', 'Mexican', 'Non-Vegetarian', 'Hard', '2025-07-29 07:04:39', 0),
(131, 'Sopa de Lima', 'Yucatecan lime soup with chicken.', 'Yucatecan lime soup with chicken.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(132, 'Tostadas', 'Crispy tortillas topped with beans, veggies, and meat.', 'Crispy tortillas topped with beans, veggies, and m.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(133, 'Carne Asada', 'Grilled marinated beef.', 'Grilled marinated beef.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(134, 'Elote', 'Grilled Mexican street corn with cheese and chili.', 'Grilled Mexican street corn with cheese and chili.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(135, 'Fajitas', 'Sizzling meat and peppers served with tortillas.', 'Sizzling meat and peppers served with tortillas.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(136, 'Huevos Rancheros', 'Fried eggs on tortillas with salsa.', 'Fried eggs on tortillas with salsa.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(137, 'Mole Poblano', 'Rich chili and chocolate sauce over meat.', 'Rich chili and chocolate sauce over meat.jpg', 'Mexican', 'Non-Vegetarian', 'Hard', '2025-07-29 07:04:39', 0),
(138, 'Mexican Rice', 'Spiced tomato-flavored rice.', 'Spiced tomato-flavored rice.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(139, 'Refried Beans', 'Mashed and fried pinto beans.', 'Mashed and fried pinto beans.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(140, 'Salsa Roja', 'Red chili and tomato salsa.', 'Red chili and tomato salsa.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(141, 'Salsa Verde', 'Green salsa made with tomatillos.', 'Green salsa made with tomatillos.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(142, 'Pico de Gallo', 'Fresh tomato, onion, and cilantro salad.', 'Fresh tomato, onion, and cilantro salad.jpg', 'Mexican', 'Vegan', 'Easy', '2025-07-29 07:04:39', 0),
(143, 'Chicken Tinga', 'Shredded chicken in chipotle tomato sauce.', 'Shredded chicken in chipotle tomato sauce.jpg', 'Mexican', 'Non-Vegetarian', 'Medium', '2025-07-29 07:04:39', 0),
(144, 'Taco Salad', 'Salad with taco toppings in a tortilla shell.', 'Salad with taco toppings in a tortilla shell.jpg', 'Mexican', 'Vegetarian', 'Easy', '2025-07-29 07:04:39', 0),
(145, 'Pad Thai (Gluten-Free)', 'Rice noodles stir-fried with shrimp, tofu, and peanuts.', 'Pad Thai.jpg', 'Thai', 'Gluten-Free', 'Medium', '2025-08-17 05:00:00', 0),
(146, 'Chana Masala (Gluten-Free)', 'Spicy chickpeas cooked with aromatic spices.', 'Chana Masala.jpg', 'Indian', 'Gluten-Free', 'Easy', '2025-08-17 05:00:00', 0),
(150, 'Chicken Tacos (Gluten-Free)', 'Soft corn tortillas filled with seasoned chicken and vegetables.', 'Chicken Tacos one.jpg', 'Mexican', 'Gluten-Free', 'Easy', '2025-08-17 05:00:00', 0),
(151, 'Green Curry (Gluten-Free)', 'Coconut milk-based green curry with vegetables.', 'Green Curry.jpg', 'Thai', 'Gluten-Free', 'Medium', '2025-08-17 05:00:00', 0),
(152, 'Dal Tadka (Gluten-Free)', 'Yellow lentils tempered with spices, gluten-free.', 'Dal Tadka.jpg', 'Indian', 'Gluten-Free', 'Easy', '2025-08-17 05:00:00', 0),
(153, 'Panna Cotta (Gluten-Free)', 'Creamy Italian dessert made with gelatin, gluten-free.', 'Panna Cotta.jpg', 'Italian', 'Gluten-Free', 'Easy', '2025-08-17 05:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_attempt` int(11) NOT NULL DEFAULT 0,
  `last_attempt` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `failed_attempts` int(11) DEFAULT 0,
  `lockout_time` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `login_attempt`, `last_attempt`, `created_at`, `failed_attempts`, `lockout_time`, `avatar`) VALUES
(1, 'su', 'ko', 'suko@gmail.com', '$2y$10$RUBJ12Fvrjv17RBH3dpiIu2zUf0GybD8TTViBNj4hmJu4p2XrVAde', 0, NULL, '2025-07-28 05:23:37', 4, '2025-08-03 17:20:37', NULL),
(2, 'su', 'yi', 'suyi@gmail.com', '$2y$10$4ggVUiXGqiI2t28n7R7c8uD0JeGeyc7/yuIxSNbqcdKGTs866r7K.', 0, NULL, '2025-08-04 15:04:08', 0, NULL, NULL),
(3, 'li', 'su yi', 'lisuyi@gmail.com', '$2y$10$kb3jCWpPJ.df7oADBfT4MO..aLcVOawJQcNZWhyq2NrjHeTS.Awoq', 0, NULL, '2025-08-04 15:17:49', 1, NULL, NULL),
(4, 'ester', 'ester', 'ester@gmail.com', '$2y$10$xjBVtRgJHzom0sQqeyCiRuA1YbAhpRvLWurtcde3dR7gOcuLDz2K2', 0, NULL, '2025-08-06 14:30:24', 0, NULL, NULL),
(5, 'luffy', 'li', 'luffy@gmail.com', '$2y$10$uQowtqJpHaSiXmV0wXOXgOI7NZEADvBUm24lfFgbyLl7duWVoQ8o2', 0, NULL, '2025-08-07 10:15:48', 0, NULL, NULL),
(6, 'ddgh', 'dfgfh', 'dshfsh@gmail.com', '$2y$10$03uwwMH8OTtPLzUU0WwheOa/Ea0xZ33gr8wOXfl2zM7THvaa3HTe.', 0, NULL, '2025-08-11 17:19:27', 0, NULL, NULL),
(7, 'li', 'liko', 'liliko@gmail.com', '$2y$10$1ak2nNIxThcgWfK5KF1K0.4DlufAKpSKbL6PxelNa5Z6/WA.vlfG6', 0, NULL, '2025-08-17 02:20:14', 0, NULL, NULL),
(8, 'Yi', 'Ko', 'yiko@gmail.com', '$2y$10$mHLsc8nmV2LIbXtlY7KMK.70zaWg0lqP6GbdB9GWhcDaXGJmw4YMq', 0, NULL, '2025-08-17 03:44:50', 0, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook`
--
ALTER TABLE `cookbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cookbook_likes`
--
ALTER TABLE `cookbook_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cookbook`
--
ALTER TABLE `cookbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cookbook_likes`
--
ALTER TABLE `cookbook_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cookbook_likes`
--
ALTER TABLE `cookbook_likes`
  ADD CONSTRAINT `cookbook_likes_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `cookbook` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
