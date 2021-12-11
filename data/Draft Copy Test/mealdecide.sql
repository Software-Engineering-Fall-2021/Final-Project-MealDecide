DROP database IF EXISTS mealdecide;
CREATE database `mealdecide`;

USE mealdecide;

DROP TABLE IF EXISTS Restaurant;
CREATE TABLE IF NOT EXISTS Restaurant(
  restaurant_id           INTEGER  NOT NULL AUTO_INCREMENT,
  name                    VARCHAR(33) NOT NULL,
  rating                  NUMERIC(3,1) NOT NULL,
  price_level             VARCHAR(8) NOT NULL,
  description             VARCHAR(503),
  subcategory             VARCHAR(8),
  establishment_type      VARCHAR(11) NOT NULL,
  restriction_description VARCHAR(29),
  cuisine_description     VARCHAR(52),
  PRIMARY KEY (restaurant_id),
  INDEX restaurant_idx (name, price_level)
) ENGINE=InnoDB AUTO_INCREMENT=31;

INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (1,'Mamma Onesta''s Italian Restaurant',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian','Restaurants','Italian');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (2,'La Crepe Bistro',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Vegan Gluten Free','Restaurants','European, French');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (3,'Honey Field Pancake House',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Vegan Gluten Free','Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (4,'McWethy''s Tavern',4.5,'$$ - $$$','Scottish inspired, American made. Located in the new clubhouse at Mistwood Golf Club. With handcrafted & locally sourced cuisine, featuring steaks, chops & signature sandwiches. A full list of spirits, craft beers and wine compliment the cuisine.','sit_down','Gluten Free','Restaurants','Pub, Scottish, Bar, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (5,'Tallgrass Restaurant',4.5,'$$$$',NULL,'sit_down','Gluten Free','Restaurants','Contemporary, American, French');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (6,'Rustic Knead',4.5,'$$ - $$$',NULL,'cafe','Vegetarian Vegan Gluten Free','Restaurants','Soups, Cafe, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (7,'Blueberry Hill Pancake House',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Gluten Free Vegan','Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (8,'Baby Back Blues',4.5,'$$ - $$$',NULL,'sit_down',NULL,'Quick Bites','Barbecue, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (9,'La Dolce Vita of Lemont',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Gluten Free','Restaurants','Italian');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (10,'Old Town Restaurant',4.5,'$$ - $$$',NULL,'sit_down',NULL,'Restaurants','Central European, European, Eastern European, Polish');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (11,'Public Landing',4.0,'$$ - $$$','Serving steak, fresh seafood, homemade Italian dishes and comfort foods in an elegant historic setting. Housed in the Gaylord building in downtown Lockport. We have a gorgeous outdoor patio overlooking the park that allows well behaved dogs to dine with their owners all summer long. Our Yappetizer Menu features: Hot Diggity Dog, Quarter Hounder, Eggs Rover Easy and the Good Dog. House made Sangria is a summer favorite for all of the Public Landing''s great guests. We look forward to seeing you soon.','sit_down','Vegetarian Gluten Free','Restaurants','Bar, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (12,'Ats-A-Nice Pizza',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Gluten Free','Restaurants','Pizza, Italian');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (13,'White Fence Farm Restaurant',4.0,'$$ - $$$',NULL,'sit_down',NULL,'Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (14,'Nick''s Tavern',4.5,'$','Tiny Tavern with big 1lb burgers, little Nick burger, 1/4 lb.hot dogs, Italian beef sandwiches, chicken sandwiches, patty melts, grilled cheese, homemade soup and chili and nacho''s. CASH ONLY-NO CHARGE CARDS-ATM ON PREMISES!!','sit_down',NULL,'Restaurants','Pub, Bar, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (15,'Tasty Waffle',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Vegan','Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (16,'The Vegan Cafe',5.0,'$$ - $$$','The Healthy Sins Inc. Vegan Cafe is a raw, organic, gluten-free, and vegan restaurant offering appetizers, entrees, and desserts. The cafe has a relaxed, friendly atmosphere and is located in the heart of downtown Lockport. All of our food is raw, organic, gluten-free, vegan, and DELICIOUS! We hope you''ll visit soon!','sit_down','Vegetarian Vegan','Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (17,'Doc Watson''s Smokehouse',5.0,'$$ - $$$','"Doc Watson''s Smokehouse is a family owned and operated restaurant. We serve a central Texas style BBQ. All of our meats come in fresh every week and is smoked in our wood burning smoker. We do not sauce our meats."','sit_down',NULL,'Quick Bites','Barbecue, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (18,'Niko''s Breakfast Club',4.5,'$$ - $$$',NULL,'sit_down','Vegetarian Vegan Gluten Free','Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (19,'Chesdan''s Pizzeria and Grille',4.0,'$$ - $$$',NULL,'sit_down','Vegetarian','Restaurants','Italian, Pizza, Bar, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (20,'Sizzles',4.5,'$',NULL,NULL,NULL,'Quick Bites','Fast Food, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (21,'Embers Tap House',4.0,'$$ - $$$',NULL,NULL,'Vegetarian Gluten Free','Restaurants','Pub, Bar, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (22,'Tazza Italian Ristorante',4.0,'$$ - $$$',NULL,'sit_down','Vegetarian','Restaurants','Italian');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (23,'Homer''s Cafe',4.5,'$',NULL,'cafe',NULL,'Restaurants','American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (24,'Cool Creations',5.0,'$',NULL,'cafe',NULL,'Dessert',NULL);
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (25,'CraftD',4.5,'$$ - $$$','Craftd, in Plainfield, IL, is the premier restaurant serving Joliet, Shorewood, Crest Hill, Bolingbrook, Naperville and surrounding areas since 2017. We specialize in draft beers and smoked meats. For your next meal, visit Craftd in Plainfield.',NULL,'Vegetarian','Restaurants','Gastropub, Pub, Barbecue, Bar, Brew Pub, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (26,'Texas Roadhouse',4.0,'$$ - $$$','Texas Roadhouse is famous for our Hand-Cut Steaks, Fall-Off-The-Bone Ribs, Made-From-Scratch Sides and Dressings, Fresh Baked Bread, Ice Cold Beer, and Legendary Margaritas!','sit_down','Gluten Free','Restaurants','Steakhouse, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (27,'Smiley''s Gyros & Beef',4.5,'$',NULL,NULL,NULL,'Quick Bites','Greek, Fast Food');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (28,'Windy City Grill',4.5,'$',NULL,NULL,NULL,'Restaurants','Fast Food, American');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (29,'Digs on Canal Kitchen and Bar',4.5,'$$ - $$$','Our menu celebrates the unique and evolving story of Lemont, and the hardworking immigrants who built this town and community. The food is hearty, rich and made from scratch - the way folks used to cook in their kitchens. We have a full bar with domestic, import and craft beer. We have a delicious selection of cocktails. â€‹','sit_down',NULL,'Restaurants','American, Pub, African, Brew Pub');
INSERT INTO Restaurant(restaurant_id,name,rating,price_level,description,subcategory,restriction_description,establishment_type,cuisine_description) VALUES (30,'Turnabout Pizza',4.5,'$',NULL,'sit_down','Vegetarian','Restaurants','Pizza');

DROP TABLE IF EXISTS Contact;
CREATE TABLE IF NOT EXISTS Contact(
  restaurant_id INTEGER  NOT NULL,
  phone         VARCHAR(15) NOT NULL,
  website       VARCHAR(80) NOT NULL,
  email         VARCHAR(31),
  address       VARCHAR(56) NOT NULL,
  CONSTRAINT `fk_restaurant_contact`
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (restaurant_id),
  INDEX contact_idx (phone, website)

) ENGINE = InnoDB;
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (1,'+1 815-588-0900','http://mammaonesta.com/','frank@mammaonesta.com','1100 S State St, Lockport, IL 60441-3512');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (2,'+1 708-966-4866','http://www.lacrepebistro.com/','info@lacrepebistro.com','13957 S Bell Rd, Homer Glen, IL 60491-8503');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (3,'+1 815-836-3880','http://www.honeyfieldrestaurant.com/',NULL,'982 E 9th St, Lockport, IL 60441-3235');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (4,'+1 815-254-7001','http://www.mcwethystavern.com/','info@mcwethystavern.com','1700 Renwick Rd, Romeoville, IL 60446-5256');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (5,'+1 815-838-5566','http://www.tallgrassrestaurant.com/',NULL,'1006 S State St, Lockport, IL 60441-3438');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (6,'+1 630-296-0660','http://www.facebook.com/rusticknead/','info@rusticknead.com','1130 State St, Lemont, IL 60439-4235');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (7,'+1 708-645-0766','http://blueberrybreakfastcafe.com/',NULL,'14355 S Bell Rd, Homer Glen, IL 60491-7876');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (8,'+1 815-254-6939','https://babybackblues.com/','ken@babybackblues.com','16200 S Lincoln Hwy Suite 114, Plainfield, IL 60586-5153');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (9,'+1 630-257-9111','http://www.ladolcevitalemont.com',NULL,'107 Stephen St, Lemont, IL 60439-3634');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (10,'+1 630-257-7570','http://www.oldtownrestaurant.com/index.html','info@oldtownrestaurant.com','113 Stephen St Ste 1, Lemont, IL 60439-3407');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (11,'+1 815-838-6500','http://www.publiclandingrestaurant.com','publiclanding@sbcglobal.net','200 W 8th St 158th and Archer, Lockport, IL 60441-2878');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (12,'+1 815-886-5200','http://www.atsanice.com/','info@atsanice.com','334 N Independence Blvd Ste A, Romeoville, IL 60446-1815');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (13,'+1 630-739-1720','http://whitefencefarm-il.com','wffchicago@yahoo.com','1376 Joliet Rd, Romeoville, IL 60446-4078');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (14,'+1 630-257-6564','http://www.nickstavern.net/Home.php','nickstavern@comcast.net','221 Main St, Lemont, IL 60439-3624');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (15,'+1 815-439-8151','http://www.tastywafflepancakehouse.com',NULL,'638 S Weber Rd Ste 642, Romeoville, IL 60446-4999');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (16,'+1 815-838-4626','http://www.hsvegancafelockport.com/','rum96@comcast.net','928 S State St, Lockport, IL 60441-3436');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (17,'+1 815-524-3774','http://www.docwatsonssmokehouse.com','info@docwatsonssmokehouse.com','444 N Weber Rd A, Romeoville, IL 60446-5144');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (18,'+1 815-886-3344','http://www.nikosbreakfastclub.com/Home_Page.php',NULL,'38 S Weber Rd, Romeoville, IL 60446-4947');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (19,'+1 708-301-8300','http://chesdanspizza.com',NULL,'15764 S Bell Rd, Homer Glen, IL 60491-8400');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (20,'+1 815-524-4391','https://www.facebook.com/sizzlesinlockport/',NULL,'110 Macgregor Rd, Lockport, IL 60441-2712');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (21,'+1 815-552-3031','http://www.facebook.com/EmbersTapHouse',NULL,'933 S State St, Lockport, IL 60441-3435');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (22,'+1 708-645-0485','http://www.tazzaristorante.com','info@tazzaitalianristorante.com','14065 S Bell Rd, Homer Glen, IL 60491-8463');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (23,'+1 708-301-2353','http://www.facebook.com/homerscafe15756/',NULL,'15756 S Bell Rd, Homer Glen, IL 60491-8400');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (24,'+1 815-838-4700','http://www.coolcreationsicecream.com',NULL,'937 S Hamilton St, Lockport, IL 60441-3782');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (25,'+1 815-782-8832','http://www.thecraftdlife.com/','craftdplainfield@gmail.com','16031 S Lincoln Hwy, Plainfield, IL 60586-5181');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (26,'+1 815-577-9003','https://www.texasroadhouse.com/locations/illinois/joliet',NULL,'3151 Tonti Dr, Joliet, IL 60431-1103');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (27,'+1 815-577-3877','http://smileysgyroandbeef.com/',NULL,'15934 S Route 59, Plainfield, IL 60586-9244');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (28,'+1 815-293-1000','https://windygrill.com/',NULL,'300 N Independence Blvd, Romeoville, IL 60446-1816');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (29,'+1 630-243-7210','http://Digsoncanal.com','Info@digsoncanal.com','316 Canal St, Lemont, IL 60439-3604');
INSERT INTO Contact(restaurant_id,phone,website,email,address) VALUES (30,'+1 630-257-2275','http://turnaboutpizza.com/',NULL,'1000 Main St, Lemont, IL 60439-3750');

DROP TABLE IF EXISTS Cuisine;
CREATE TABLE IF NOT EXISTS Cuisine(
  cuisine_id    INTEGER NOT NULL AUTO_INCREMENT,
  label         VARCHAR(16) NOT NULL,
  restaurant_count  INTEGER DEFAULT 0,
  recipe_count  INTEGER NOT NULL,
  category      VARCHAR(5) NOT NULL,
  PRIMARY KEY (cuisine_id),
  INDEX cuisine_idx (label, category)

) ENGINE=InnoDB AUTO_INCREMENT=97;

INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (1,'African',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (2,'Alfredo',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (3,'American',79,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (4,'Arabic',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (5,'Asian',10,'ASIAN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (6,'Bar',30,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (7,'Barbecue',6,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (8,'Beef',13,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (9,'Beer restaurants',1,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (10,'Brew Pub',3,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (11,'Bruschette',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (12,'Burger',23,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (13,'Burrito',4,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (14,'Cafe',11,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (15,'Cakes',2,'DESRT');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (16,'Calamari',3,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (17,'Cantonese',2,'CHINA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (18,'Central European',2,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (19,'Cheeseburger',1,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (20,'Chinese',11,'CHINA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (21,'Chocolate mousse',1,'DESRT');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (22,'Clams',1,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (23,'Contemporary',1,'FORMA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (24,'Crab',3,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (25,'Crepes',1,'FRANC');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (26,'Deli',3,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (27,'Diner',2,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (28,'Duck',3,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (29,'Dumplings',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (30,'Eastern European',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (31,'Eggplant',1,'VEGET');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (32,'European',5,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (33,'Fast Food',27,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (34,'Fish',11,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (35,'Fish & Chips',1,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (36,'French',2,'FRANC');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (37,'French Fries',1,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (38,'French Toast',2,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (39,'Fried rice',1,'ASIAN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (40,'Gastropub',1,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (41,'Gelato',1,'DESRT');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (42,'Greek',3,'MEDET');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (43,'Grill',2,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (44,'Gyros',4,'MEDET');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (45,'Hamburgers',1,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (46,'Ice Cream',13,'DESRT');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (47,'International',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (48,'Italian',28,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (49,'Italian Beef',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (50,'Japanese',4,'JAPAN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (51,'Lamb',1,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (52,'Lasagne',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (53,'Latin',4,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (54,'Mac and cheese',2,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (55,'Meatballs',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (56,'Meatloaf',3,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (57,'Mediterranean',1,'MEDET');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (58,'Mexican',30,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (59,'Omelette',4,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (60,'Pancakes',7,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (61,'Paninis',1,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (62,'Pasta',9,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (63,'Perogies',1,'POLIS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (64,'Pesto',7,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (65,'Pizza',34,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (66,'Polish',3,'POLIS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (67,'Pork',8,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (68,'Pork Tenderloin',2,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (69,'Pretzel',2,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (70,'Pub',32,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (71,'Ribs',5,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (72,'Salad',31,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (73,'Salmon',3,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (74,'Sandwiches',8,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (75,'Scallops',3,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (76,'Scottish',1,'INATL');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (77,'Seafood',2,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (78,'Shrimp',10,'SEAFO');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (79,'Soups',2,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (80,'Southwestern',1,'AMERI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (81,'Spanish',4,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (82,'Steak Frites',1,'MEATS');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (83,'Steakhouse',5,'FORMA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (84,'Steak Sandwich',1,'CASUA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (85,'Sushi',6,'JAPAN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (86,'Szechuan',1,'CHINA');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (87,'Tacos',8,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (88,'Tapas',8,'LATIN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (89,'Thai',2,'ASIAN');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (90,'Toasts',2,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (91,'Tortellini',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (92,'Tortelloni',1,'ITALI');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (93,'Waffles',2,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (94,'Waffles & Crepes',1,'BREAK');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (95,'Wine Bar',1,'ALCOH');
INSERT INTO Cuisine(cuisine_id,label,restaurant_count,category) VALUES (96,'Wings',9,'CASUA');


DROP TABLE IF EXISTS Restaurant_By_Cuisine;
CREATE TABLE IF NOT EXISTS Restaurant_by_Cuisine(
    cuisine_id    INTEGER  NOT NULL,
    restaurant_id    INTEGER  NOT NULL,
    CONSTRAINT PK_Restaurant_by_Cuisine PRIMARY KEY (restaurant_id, cuisine_id),
    CONSTRAINT `fk_restaurant_restaurant_by_cuisine`
      FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    CONSTRAINT `fk_cuisine_restaurant_by_cuisine`
      FOREIGN KEY (cuisine_id) REFERENCES cuisine(cuisine_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
    ) ENGINE=InnoDB;

INSERT INTO Restaurant_By_Cuisine(restaurant_id, cuisine_id) VALUES (1,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (2,32);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (2,36);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (3,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (4,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (4,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (4,70);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (4,76);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (5,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (5,36);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (5,23);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (6,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (6,14);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (6,79);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (7,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (7,60);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (8,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (8,7);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (9,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (10,18);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (10,30);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (10,32);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (10,66);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (11,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (11,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (12,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (12,65);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (13,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (14,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (14,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (14,70);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (15,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (15,38);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (15,60);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (15,93);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (16,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (16,14);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (17,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (17,7);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (18,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (18,38);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (18,60);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (18,93);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (19,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (19,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (19,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (19,65);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (20,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (20,33);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (21,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (21,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (21,70);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (22,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (22,65);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (23,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (23,14);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (24,15);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (24,46);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,6);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,7);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,10);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,40);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (25,70);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (26,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (26,83);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (27,33);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (27,42);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (28,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (28,33);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (29,1);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (29,3);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (29,10);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (29,70);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (30,48);
INSERT INTO Restaurant_by_Cuisine(restaurant_id, cuisine_id) VALUES (30,65);

CREATE TABLE IF NOT EXISTS Restriction(
  restriction_id   INTEGER  NOT NULL AUTO_INCREMENT,
  label            VARCHAR(17) NOT NULL,
  restaurant_count INTEGER  NOT NULL,
  recipe_count     INTEGER  NOT NULL,
  PRIMARY KEY (restriction_id),
  INDEX restriction_idx (label)
) ENGINE=InnoDB AUTO_INCREMENT=40;

INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (1,'Alcohol-Cocktail',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (2,'Alcohol-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (3,'Celery-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (4,'Crustcean-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (5,'Dairy-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (6,'DASH',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (7,'Egg-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (8,'Fish-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (9,'FODMAP-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (10,'Gluten-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (11,'Immuno-Supportive',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (12,'Keto-Friendly',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (13,'Kidney-Friendly',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (14,'Kosher',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (15,'Low Potassium',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (16,'Low Sugar',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (17,'Lupine-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (18,'Mediterranean',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (19,'Mollusk-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (20,'Mustard-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (21,'No oil added',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (22,'Paleo',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (23,'Peanut-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (24,'Pescatarian',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (25,'Pork-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (26,'Red-Meat-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (27,'Sesame-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (28,'Shellfish-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (29,'Soy-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (30,'Sugar-Conscious',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (31,'Sulfite-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (32,'Tree-Nut-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (33,'Vegan',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (34,'Vegetarian',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (35,'Wheat-Free',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (36,'Low-Carb',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (37,'Low-Fat',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (38,'Low-Sodium',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (39,'High-Fiber',0,0);
INSERT INTO Restriction(restriction_id,label,restaurant_count,recipe_count) VALUES (40,'Balanced',0,0);

DROP TABLE IF EXISTS Restaurant_by_Restriction;
CREATE TABLE IF NOT EXISTS Restaurant_by_Restriction(
    restaurant_id    INTEGER  NOT NULL,
    restriction_id   INTEGER  NOT NULL,
    CONSTRAINT `PK_Restaurant_by_Restriction` PRIMARY KEY (restaurant_id, restriction_id),
    CONSTRAINT `fk_restaurant_restaurant_by_restriction`
      FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    CONSTRAINT `fk_restriction_restaurant_by_restriction`
      FOREIGN KEY (restriction_id) REFERENCES restriction(restriction_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
    ) ENGINE=InnoDB;

INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (1,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (2,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (2,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (2,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (3,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (3,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (3,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (4,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (5,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (6,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (6,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (6,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (7,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (7,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (7,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (9,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (9,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (11,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (11,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (12,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (12,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (15,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (15,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (16,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (16,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (18,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (18,33);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (18,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (19,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (21,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (21,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (22,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (25,34);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (26,10);
INSERT INTO Restaurant_by_Restriction(restaurant_id,restriction_id) VALUES (30,34);

UPDATE Restriction SET restaurant_count=(SELECT COUNT(restriction_id)
FROM Restaurant_by_Restriction
WHERE restriction_id=10) WHERE restriction_id=10;

UPDATE Restriction SET restaurant_count=(SELECT COUNT(restriction_id)
FROM Restaurant_by_Restriction
WHERE restriction_id=33) WHERE restriction_id=33;

UPDATE Restriction SET restaurant_count=(SELECT COUNT(restriction_id)
FROM Restaurant_by_Restriction
WHERE restriction_id=34) WHERE restriction_id=34;

DROP TABLE IF EXISTS Recipe;
CREATE TABLE IF NOT EXISTS Recipe(
  recipe_id  INTEGER  NOT NULL AUTO_INCREMENT, 
  label       VARCHAR(62) NOT NULL,
  source      VARCHAR(23) NOT NULL,
  url         VARCHAR(100) NOT NULL,
  yield       INTEGER  NOT NULL,
  dietLabels  VARCHAR(106),
  cautions    VARCHAR(28),
  calories    NUMERIC(19,14) NOT NULL,
  cuisineType VARCHAR(19) NOT NULL,
  mealType    VARCHAR(22) NOT NULL,
  dishType    VARCHAR(30) NOT NULL,
  PRIMARY KEY (recipe_id),
  INDEX recipe_idx (label, url, dietLabels, cuisineType, mealType, dishType)
) ENGINE=InnoDB AUTO_INCREMENT=77;
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (1,'Breakfast Sausage Puffs','Martha Stewart','https://www.marthastewart.com/868891/breakfast-sausage-puffs',8,'Low-Carb','Sulfites',1594.74,'american','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (2,'Recipe: Muffin-Pan Breakfast Sliders','The Kitchn','http://www.thekitchn.com/recipe-muffin-pan-breakfast-sliders-234089',4,'Low-Carb','Sulfites',750.472525475,'american','breakfast','sandwiches');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (3,'The Wrangler Breakfast Taco recipes','Food Republic','http://www.foodrepublic.com/recipes/the-wrangler-breakfast-taco-recipe/',4,'Low-Carb','Sulfites',5452.255234373065,'american','breakfast','sandwiches');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (4,'Breakfast Patty Melt recipes','Pioneer Woman','http://thepioneerwoman.com/cooking/breakfast-patty-melt/',2,'Low-Carb','Sulfites',1376.5885254749999,'american','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (5,'Sausage and Potato Breakfast Casserole','Epicurious','https://www.epicurious.com/recipes/food/views/sausage-and-potato-breakfast-casserole-4387',6,'Low-Carb','Sulfites',2620.3112267990386,'central europe','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (6,'Breakfast Sausage, Mushroom, and Cheddar Rolls Recipe','Serious Eats','http://www.seriouseats.com/recipes/2014/01/breakfast-sausage-mushroom-cheddar-roll-recipe.html',10,NULL,'Sulfites',3647.3027092124125,'british','breakfast','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (7,'Breakfast Focaccia recipes','Tasting Table','http://www.tastingtable.com/cook/recipes/breakfast-focaccia-bread-bacon-sausage-eggs-sheet-tray-meal',7,'Balanced','Sulfites',5011.2619928358135,'italian','breakfast','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (8,'Tropical Breakfast Parfait','Food Network','https://www.foodnetwork.com/recipes/rachael-ray/tropical-breakfast-parfait-recipe-1957021',4,'Low-Fat Low-Sodium','Sulfites',675.7838888888889,'french','breakfast','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (9,'Breakfast Nachos recipes','Food & Wine','http://www.foodandwine.com/recipes/breakfast-nachos',4,'High-Fiber Low-Carb','Soy Sulfites FODMAP',3673.0265561506485,'mexican','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (10,'Breakfast Corn Dogs recipes','Chowhound','http://www.chowhound.com/recipes/breakfast-corn-dogs-29846',14,NULL,'Sulfites',4759.165988386091,'american','breakfast','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (11,'Potato, Sausage, And Spinach Breakfast Casserole','Bon Appetit','http://www.bonappetit.com/recipes/2011/11/potato-sausage-and-spinach-breakfast-casserole',8,'Low-Carb','Sulfites',4911.1981083625005,'british','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (12,'Cheesy Breakfast Monkey Bread With Sausage and Eggs','Food52','https://food52.com/recipes/66125-cheesy-breakfast-monkey-bread-with-sausage-and-eggs',6,NULL,'Sulfites',4291.929695049038,'american','breakfast','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (13,'Breakfast Taquitos','Delish','http://www.delish.com/cooking/recipe-ideas/recipes/a48242/breakfast-taquitos-recipe/',4,NULL,'Eggs Milk Sulfites',2332.268000000061,'mexican','breakfast','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (14,'McDonald’s Breakfast Burrito','The Daily Meal','http://www.thedailymeal.com/recipes/mcdonald-s-breakfast-burrito-recipe',8,NULL,'Sulfites',1525.5571763894063,'mexican','breakfast','sandwiches');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (15,'Dinner Tonight: Breakfast Sausage, Home Fries, and Eggs Recipe','Serious Eats','http://www.seriouseats.com/recipes/2010/06/breakfast-sausage-home-fries-eggs-recipe.html',4,'Low-Carb','Sulfites FODMAP',2110.604194590627,'central europe','breakfast lunch dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (16,'Sausage, Cheese And Potato Breakfast Casserole','Whipped','http://whippedtheblog.com/2009/07/20/sausage-cheese-and-potato-breakfast-casserole/',5,'Low-Carb','Sulfites',2620.3112267990386,'central europe','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (17,'Apple, Sausage, and Cheddar Monkey Bread','Real Simple','https://www.realsimple.com/food-recipes/browse-all-recipes/apple-sausage-cheddar-monkey-bread',12,'Balanced','Sulfites',2873.3003736500004,'american','breakfast','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (18,'Sausage Breakfast Casserole','Whole Foods','http://www.wholefoodsmarket.com/recipes/2397',6,NULL,'Sulfites',2530.4558009500006,'central europe','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (19,'Sausage-Kale Breakfast Strata','Pioneer Woman','http://thepioneerwoman.com/cooking/2012/01/sausage-kale-strata/',12,'Low-Carb','Sulfites',11048.689780725797,'american','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (20,'Make-Ahead Breakfast Casserole','My Recipes','http://www.myrecipes.com/recipe/make-ahead-breakfast-casserole',6,NULL,'Sulfites FODMAP',3648.1968744042406,'british','breakfast','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (21,'Dessert-Wine-Poached Pears','Donna Hay','http://www.donnahay.com.au/recipes/sweets/fruit/dessert-wine-poached-pears',6,'Low-Fat Low-Sodium','Sulfites',2395.813535155955,'french','lunch/dinner','dessert desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (22,'French Apple Tart (Tarte Fine aux Pommes) vegan','Food52','https://food52.com/recipes/32157-french-apple-tart-tarte-fine-aux-pommes-vegan',8,'Low-Sodium','Sulfites',1003.8917975546144,'french american','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (23,'Grapefruit Dessert','Martha Stewart','https://www.marthastewart.com/632489/grapefruit-dessert',4,'Low-Fat Low-Sodium','Sulfites',533.8,'american','breakfast lunch/dinner','desserts main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (24,'Cantaloupe and Black Pepper Granita','Epicurious','https://www.epicurious.com/recipes/food/views/cantaloupe-and-black-pepper-granita-51242080',8,'Low-Fat Low-Sodium','Sulfites',738.0860616000001,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (25,'Moroccan Orange Dessert','Simply Recipes','http://simplyrecipes.com/recipes/moroccan_orange_dessert/',2,'High-Fiber Low-Fat Low-Sodium','Sulfites',271.808,'american','lunch/dinner','desserts main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (26,'Gooseberry Meringue Tart','BBC Good Food','http://www.bbcgoodfood.com/recipes/3935/',4,'High-Fiber','Sulfites',3447.8272500004373,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (27,'Riz au Lait à la Framboise','Chocolate & Zucchini','http://chocolateandzucchini.com/recipes/desserts/raspberry-rice-pudding-recipe/',6,'Low-Sodium','Sulfites',1556.2058923677891,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (28,'Cheese Meets Dessert','Honest Cooking','http://honestcooking.com/cheese-meets-dessert-stilton-cheese-cake-recipe/',10,NULL,'Sulfites',1886.7926666666667,'american','lunch/dinner teatime','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (29,'Grilled Pound Cake With Basil-Plum Compote','Saveur','http://www.saveur.com/article/Recipes/Grilled-Pound-Cake-with-Basil-Plum-Compote',8,NULL,'Sulfites',2483.3251459539997,'british','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (30,'Crisp Crêpes Filled With Caramel','Food & Wine','http://www.foodandwine.com/recipes/crisp-crepes-filled-with-caramel',12,'Low-Fat Low-Sodium',NULL,3427.24,'american','lunch/dinner','dessert');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (31,'Dessert Crêpes','Cookstr','http://www.cookstr.com/recipes/dessert-crecircpes',6,'Balanced Low-Sodium','Wheat',1176.1933125021214,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (32,'Vegan toffee apple upside-down cake','Jamie Oliver','http://www.jamieoliver.com/recipes/fruit-recipes/vegan-toffee-apple-upside-down-cake/',9,NULL,'Sulfites FODMAP',3103.5382228631856,'british','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (33,'Dessert Napoleon','Real Simple','https://www.realsimple.com/food-recipes/browse-all-recipes/dessert-napoleon',4,'High-Fiber','Sulfites',2541.8090242999997,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (34,'Jelly Worms in Dirt','Food Network','https://www.foodnetwork.com/recipes/jelly-worms-in-dirt-2644287',8,'Balanced',NULL,2171.5227256171875,'american','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (35,'Dessert "Salsa"','Good Housekeeping','http://www.goodhousekeeping.com/food-recipes/a6522/dessert-salsa-4375/',5,'Low-Fat Low-Sodium','Sulfites',230.31499999994324,'mexican','lunch/dinner','desserts condiments and sauces');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (36,'Strawberry Shortcake Icebox Cake','Delish','https://www.delish.com/cooking/recipe-ideas/a22745585/strawberry-shortcake-icebox-cake-recipe/',8,'Low-Sodium','Sulfites',668.3593333333333,'french','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (37,'Pomegranate Masghati Dessert','EatingWell','http://www.eatingwell.com/recipe/277630/pomegranate-masghati-dessert/',6,NULL,'Gluten Wheat Sulfites',880.3649999969081,'american','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (38,'Strawberry Refrigerator Cake','Food52','https://food52.com/recipes/4842-strawberry-refrigerator-cake',6,NULL,'Sulfites',3420.3549999991824,'american','lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (39,'Cranberry Nut Dessert','Use Real Butter','http://userealbutter.com/2007/12/11/cranberry-nut-dessert-recipe/',8,'Low-Sodium','Sulfites',2655.613,'american','lunch/dinner','dessert desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (40,'Cream Puff Dough (Pâte à Choux) recipes','My Recipes','http://www.myrecipes.com/recipe/cream-puff-dough-pte-choux',2,NULL,NULL,1602.4393232241823,'french','lunch/dinner','dessert');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (41,'Chicken Vesuvio','Serious Eats','https://www.seriouseats.com/chicken-vesuvio-recipe',4,'Low-Carb Dairy-Free Gluten-Free Egg-Free Peanut-Free Tree-Nut-Free Soy-Free Fish-Free Shellfish-Free','Sulfites',1057,'american','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (42,'Tomato & Dinner Roll Panzanella','Big Girls Small Kitchen','http://www.biggirlssmallkitchen.com/2010/08/recipe-flash-tomato-dinner-roll.html',1,'High-Fiber','Sulfites FODMAP',468.36196874882853,'italian','lunch/dinner','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (43,'Garlic Butter Dinner Rolls','Food Network','https://www.foodnetwork.com/recipes/ree-drummond/garlic-butter-dinner-rolls-2371536',24,'Low-Sodium',NULL,5395.56,'american','lunch/dinner','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (44,'Dinner Tonight: Custardy Popovers','Serious Eats','http://www.seriouseats.com/recipes/2007/12/dinner-tonight-custardy-popovers-recipe.html',6,'Balanced',NULL,1172.9279999999999,'american','lunch/dinner','bread');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (45,'Roast Chicken Dinner','Epicurious','http://www.epicurious.com/recipes/food/views/Roast-Chicken-Dinner-232787',4,'Low-Carb','Gluten Wheat Sulfites',2880.353520954943,'french','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (46,'Chicken Peprikash','Food Network','https://norecipes.com/chicken-paprikash/',4,'Low-Carb Egg-Free Peanut-Free Tree-Nut-Free Soy-Free Fish-Free Shellfish-Free',NULL,758,'european','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (47,'Prawn And Watercress Rolls','Donna Hay','http://www.donnahay.com.au/recipes/mains/seafood/prawn-and-watercress-rolls',6,'Balanced','Sulfites',948.3139571248746,'british','lunch/dinner','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (48,'Classic Dinner Pancakes recipes','Pinch of Yum','http://pinchofyum.com/classic-dinner-pancakes',6,'Balanced',NULL,1384.1203333325157,'american','lunch/dinner','pancake');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (49,'Spam in a Blanket','The Daily Meal','http://www.thedailymeal.com/recipes/spam-blanket-recipe',10,NULL,'Sulfites FODMAP',1428.2489574,'american','lunch/dinner','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (50,'Dinner Tonight: Popcorn Chickpeas','Serious Eats','http://www.seriouseats.com/recipes/2007/08/dinner-tonight-popcorn-chickpe.html',4,'High-Fiber','Sulfites',955.0945633244688,'american','lunch/dinner','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (51,'Family Dinner Pasta','Men''s Health','https://www.menshealth.com/recipes/family-dinner-pasta',2,'Low-Fat Low-Sodium','Sulfites',172.348515624692,'american','lunch/dinner','sandwiches');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (52,'Vietnamese Sugar Steak','Food52','https://food52.com/recipes/34678-vietnamese-sugar-steak',4,'Low-Fat Low-Sodium','Sulfites',256,'american','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (53,'Teriyaki Steak','Steamy Kitchen','http://steamykitchen.com/17758-steak-teriyaki-recipe.html',4,'Low-Fat Low-Sodium','Sulfites',510,'japanese','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (54,'Steak Quesadilla','Men''s Health','https://www.prevention.com/food-nutrition/recipes/a20511981/steak-quesadilla/',6,'Low-Sodium Gluten-Free Egg-Free Peanut-Free Tree-Nut-Free Soy-Free Fish-Free Shellfish-Free','Sulfites',217,'latin','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (55,'Vegetarian Tuscan Vegetable Soup','The Daily Meal','http://www.thedailymeal.com/recipes/vegetarian-tuscan-vegetable-soup-recipe',4,'Low-Sodium Gluten-Free Egg-Free Peanut-Free Tree-Nut-Free Soy-Free Fish-Free Shellfish-Free','Sulfites',311,'vegetarian','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (56,'Vegan Jambalaya','Eating Well','http://www.eatingwell.com/recipe/277665/vegan-jambalaya/',6,'Balanced Dairy-Free Gluten-Free Egg-Free Peanut-Free Tree-Nut-Free Soy-Free Fish-Free Shellfish-Free Vegan','Sulfites',267,'vegan','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (57,'Dinner Tonight: Chipped Beef Gravy','Serious Eats','http://www.seriouseats.com/recipes/2010/02/chipped-beef-gravy-on-toast-stew-on-a-shingle-recipe.html',2,NULL,'Sulfites',511.85772752169066,'american','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (58,'Crispy Potato Mojos recipes','Pinch of Yum','http://pinchofyum.com/crispy-potato-mojos',5,'Balanced Low-Sodium',NULL,1413.392544,'french','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (59,'An Ideal Lunch Salad recipes','101 Cookbooks','http://www.101cookbooks.com/archives/an-ideal-lunch-salad-recipe.html',3,'Balanced High-Fiber','Gluten Wheat Sulfites FODMAP',1673.1140569281772,'american','lunch/dinner','salad');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (60,'Guilty pleasure lunch','Food52','https://food52.com/recipes/6928-guilty-pleasure-lunch',1,NULL,'Soy Sulfites',722.6115,'american','breakfast lunch/dinner','sandwiches');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (61,'Feta & clementine lunch bowl','BBC Good Food','https://www.bbcgoodfood.com/recipes/feta-clementine-lunch-bowl',2,'High-Fiber','Sulfites FODMAP',2056.7320000000636,'greek mediterranean','lunch/dinner','condiments and sauces');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (62,'Vegetarian Mezze Lunch to Go','Martha Stewart','https://www.marthastewart.com/1542558/healthy-vegetarian-mezze-lunch',2,NULL,'Sulfites',780.0519616060814,'mediterranean','lunch/dinner','starter');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (63,'Catchall Lunch Salad','EatingWell','http://www.eatingwell.com/recipe/280187/catchall-lunch-salad/',1,'High-Fiber','Sulfites FODMAP',551.10647471875,'american','lunch/dinner','salad');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (64,'Panzanella Lunch','My Recipes','http://www.myrecipes.com/recipe/panzanella-lunch',1,'Balanced High-Fiber','Sulfites',341.9261382853282,'italian','lunch/dinner','salad');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (65,'Layered Lunch','Self','http://www.self.com/drop10/recipes/lunch/2013/layered-lunch',2,'Low-Sodium','Sulfites',170.40041666585813,'american','breakfast lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (66,'''Lunch-to-Go'' Lunchbox','The Daily Meal','http://www.thedailymeal.com/lunch-go-lunchbox-recipe',1,'Low-Carb','Sulfites',976.4053847591218,'american','lunch/dinner brunch','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (67,'Chicken Dippers Lunch','Whole Foods','http://www.wholefoodsmarket.com/recipes/1110',2,'Low-Carb','Sulfites',475.80698449997385,'american','lunch/dinner','salad');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (68,'Sack Lunch: Chili-Rubbed Hanger Steak Wrap Recipe','Serious Eats','http://www.seriouseats.com/recipes/2008/01/sack-lunch-chilirubbed-hanger-steak-wrap.html',10,'High-Fiber','Sulfites FODMAP',2447.2024686689215,'american','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (69,'Green with Envy Superfood Lunch','Food52','https://food52.com/recipes/27149-green-with-envy-superfood-lunch',5,'High-Fiber','Sulfites',1671.5321249999997,'american','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (70,'Quick Mushroom Leek Lunch Pizza','The Naptime Chef','http://www.thenaptimechef.com/2013/04/quick-mushroom-leek-lunch-pizza/',6,NULL,'Sulfites',1041.4566666666667,'italian','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (71,'Are you looking for more quick, healthy lunch ideas?','The Stone Soup','http://thestonesoup.com/blog/2012/06/the-2-biggest-myths-about-home-made-lunches/',4,'High-Protein Low-Carb','Sulfites',669.0969999996843,'mediterranean','lunch/dinner brunch','salad');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (72,'Layered Lunch','Self','http://www.self.com/fooddiet/recipes/2012/05/layered-lunch',4,'Balanced Low-Sodium','Sulfites',425.06558509235185,'american','breakfast lunch/dinner','desserts');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (73,'Lunch Box Turkey "Sushi"','Rachael Ray','http://www.rachaelray.com/recipe.php?recipe_id=641',1,NULL,'Sulfites FODMAP',1326.5729150000002,'japanese','lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (74,'Grits for Breakfast, Lunch or Dinner','Cookstr','http://www.cookstr.com/recipes/grits-for-breakfast-lunch-or-dinner',10,NULL,'Sulfites FODMAP',2778.9804675965574,'american','breakfast lunch/dinner','main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (75,'Edamame Succotash Salad','Epicurious','https://www.epicurious.com/recipes/food/views/edamame-succotash-salad-243129',10,'Balanced','Sulfites FODMAP',1463.2119461000614,'american','lunch/dinner','salad main course');
INSERT INTO Recipe(recipe_id,label,source,url,yield,dietLabels,cautions,calories,cuisineType,mealType,dishType) VALUES (76,'Simple Stir Fried Red Potatoes And "Lunch"','Indian Simmer','http://www.indiansimmer.com/2012/06/simple-stir-fried-red-potatoes-and.html',4,NULL,NULL,706.1426590000001,'american','lunch/dinner','salad');

DROP TABLE IF EXISTS Recipe_by_Restriction;
CREATE TABLE IF NOT EXISTS Recipe_by_Restriction(
    recipe_id    INTEGER  NOT NULL,
    restriction_id   INTEGER  NOT NULL,
    CONSTRAINT `PK_Recipe_by_Restriction` PRIMARY KEY (recipe_id, restriction_id),
    CONSTRAINT `fk_recipe_recipe_by_restriction`
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `fk_restriction_recipe_by_restriction`
    FOREIGN KEY (restriction_id) REFERENCES restriction(restriction_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    ) ENGINE=InnoDB;
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (1,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (2,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (3,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (4,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (5,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (7,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (8,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (8,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (9,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (9,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (11,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (15,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (16,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (17,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (19,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (21,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (21,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (22,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (23,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (23,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (24,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (24,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (25,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (25,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (25,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (26,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (27,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (30,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (30,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (31,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (31,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (33,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (34,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (35,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (35,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (36,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (39,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,5);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,7);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,8);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,10);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,23);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,28);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,29);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,32);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (41,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (42,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (43,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (44,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (45,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,7);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,8);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,23);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,28);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,29);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,32);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (46,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (47,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (48,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (50,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (51,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (51,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (52,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (52,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (53,37);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (53,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,7);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,8);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,10);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,23);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,28);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,29);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,32);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (54,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,7);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,8);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,10);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,23);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,28);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,29);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,32);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,34);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (55,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,5);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,7);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,8);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,10);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,23);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,28);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,29);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,32);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,33);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (56,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (58,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (58,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (59,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (59,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (61,18);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (61,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (62,18);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (63,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (64,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (64,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (65,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (66,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (67,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (68,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (69,39);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (71,18);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (71,36);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (72,38);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (72,40);
INSERT INTO Recipe_by_Restriction(recipe_id,restriction_id) VALUES (75,40);

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=5) WHERE restriction_id=5;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=7) WHERE restriction_id=7;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=8) WHERE restriction_id=8;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=10) WHERE restriction_id=10;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=18) WHERE restriction_id=18;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=23) WHERE restriction_id=23;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=28) WHERE restriction_id=28;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=29) WHERE restriction_id=29;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=32) WHERE restriction_id=32;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=33) WHERE restriction_id=33;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=34) WHERE restriction_id=34;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=36) WHERE restriction_id=36;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=37) WHERE restriction_id=37;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=38) WHERE restriction_id=38;

UPDATE Restriction SET recipe_count=(SELECT COUNT(restriction_id)
FROM Recipe_by_Restriction
WHERE restriction_id=39) WHERE restriction_id=39;

DROP TABLE IF EXISTS Recipe_by_Cuisine;
CREATE TABLE IF NOT EXISTS Recipe_by_Cuisine(
    recipe_id    INTEGER  NOT NULL,
    cuisine_id   INTEGER  NOT NULL,
    CONSTRAINT `PK_Recipe_by_Cuisine` PRIMARY KEY (recipe_id, cuisine_id),
    CONSTRAINT `fk_recipe_recipe_by_cuisine`
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `fk_cuisine_recipe_by_cuisine`
    FOREIGN KEY (cuisine_id) REFERENCES cuisine(cuisine_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (1,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (2,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (3,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (4,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (7,48);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (8,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (9,58);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (10,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (12,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (13,58);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (14,58);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (17,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (19,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (21,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (22,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (22,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (23,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (24,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (25,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (26,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (27,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (28,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (30,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (31,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (33,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (34,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (35,58);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (36,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (37,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (38,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (39,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (40,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (41,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (42,48);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (43,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (44,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (45,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (46,32);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (48,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (49,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (50,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (51,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (52,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (53,50);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (54,53);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (57,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (58,36);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (59,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (60,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (61,42);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (61,57);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (62,57);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (63,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (64,48);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (65,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (66,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (67,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (68,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (69,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (70,48);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (71,57);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (72,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (73,50);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (74,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (75,3);
INSERT INTO Recipe_by_Cuisine(recipe_id,cuisine_id) VALUES (76,3);

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=3) WHERE cuisine_id=3;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=50) WHERE cuisine_id=50;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=53) WHERE cuisine_id=53;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=36) WHERE cuisine_id=36;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=32) WHERE cuisine_id=32;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=57) WHERE cuisine_id=57;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=48) WHERE cuisine_id=48;

UPDATE Cuisine SET recipe_count=(SELECT COUNT(cuisine_id)
FROM Recipe_by_Cuisine
WHERE cuisine_id=42) WHERE cuisine_id=42;

UPDATE Restriction SET restaurant_count=(SELECT COUNT(restriction_id)
FROM Restaurant_by_Restriction
WHERE restriction_id=40) WHERE restriction_id=40;