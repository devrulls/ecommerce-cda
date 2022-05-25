CREATE TABLE php_images
(
    id_php_images        SMALLINT,
    images_creation_date DATETIME,
    images_name          VARCHAR(50),
    images_extension     VARCHAR(50),
    CONSTRAINT PK_php_images PRIMARY KEY (id_php_images)
);

CREATE TABLE php_unit_of_measure
(
    Id_php_unit_of_measure INT AUTO_INCREMENT,
    unit_of_measure_name   VARCHAR(100),
    CONSTRAINT PK_php_unit_of_measure PRIMARY KEY (Id_php_unit_of_measure)
);

CREATE TABLE php_city
(
    Id_php_city INT AUTO_INCREMENT,
    city_name   VARCHAR(100),
    CONSTRAINT PK_php_city PRIMARY KEY (Id_php_city)
);

CREATE TABLE php_users
(
    Id_php_users        INT AUTO_INCREMENT,
    users_nickname      VARCHAR(50) NOT NULL,
    users_firstname     VARCHAR(50),
    users_lastname      VARCHAR(50),
    users_mail          VARCHAR(100),
    users_password      VARCHAR(50),
    users_statut        SMALLINT,
    users_creation_date DATETIME,
    users_adress        VARCHAR(50),
    users_adress_2      VARCHAR(50),
    users_zip_code      TINYINT,
    Id_php_city         INT,
    CONSTRAINT PK_php_users PRIMARY KEY (Id_php_users),
    CONSTRAINT FK_php_users_php_city FOREIGN KEY (Id_php_city) REFERENCES php_city (Id_php_city)
);

CREATE TABLE php_chief
(
    Id_php_users INT,
    CONSTRAINT PK_php_chief PRIMARY KEY (Id_php_users),
    CONSTRAINT FK_php_chief_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);

CREATE TABLE php_admin
(
    Id_php_users INT,
    CONSTRAINT PK_php_admin PRIMARY KEY (Id_php_users),
    CONSTRAINT FK_php_admin_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);

CREATE TABLE php_products
(
    Id_php_products INT AUTO_INCREMENT,
    products_name   VARCHAR(100),
    CONSTRAINT PK_php_products PRIMARY KEY (Id_php_products)
);

CREATE TABLE php_ingredients
(
    Id_php_products INT,
    CONSTRAINT PK_php_ingredients PRIMARY KEY (Id_php_products),
    CONSTRAINT FK_php_ingredients_php_products FOREIGN KEY (Id_php_products) REFERENCES php_products (Id_php_products)
);

CREATE TABLE php_recipe_tag
(
    Id_php_recipe_tag INT AUTO_INCREMENT,
    name              VARCHAR(50),
    CONSTRAINT PK_php_recipe_tag PRIMARY KEY (Id_php_recipe_tag)
);

CREATE TABLE php_tool
(
    Id_php_products INT,
    CONSTRAINT PK_php_tool PRIMARY KEY (Id_php_products),
    CONSTRAINT FK_php_tool_php_products FOREIGN KEY (Id_php_products) REFERENCES php_products (Id_php_products)
);

CREATE TABLE php_recipe
(
    Id_php_recipe        INT AUTO_INCREMENT,
    recipe_creation_date DATETIME,
    recipe_name          VARCHAR(75) NOT NULL,
    recipe_difficulty    SMALLINT,
    recipe_statut        SMALLINT,
    recipe_duration      TINYINT,
    Id_php_recipe_tag    INT         NOT NULL,
    id_php_images        SMALLINT,
    Id_php_users         INT         NOT NULL,
    CONSTRAINT PK_php_recipe PRIMARY KEY (Id_php_recipe),
    CONSTRAINT FK_php_recipe_php_recipe_tag FOREIGN KEY (Id_php_recipe_tag) REFERENCES php_recipe_tag (Id_php_recipe_tag),
    CONSTRAINT FK_php_recipe_php_images FOREIGN KEY (id_php_images) REFERENCES php_images (id_php_images),
    CONSTRAINT FK_php_recipe_php_chief FOREIGN KEY (Id_php_users) REFERENCES php_chief (Id_php_users)
);

CREATE TABLE php_comment
(
    Id_php_comment        INT AUTO_INCREMENT,
    comment_title         VARCHAR(150),
    comment_content       VARCHAR(150),
    comment_creation_date DATETIME,
    comment_statut        TINYINT,
    Id_php_recipe         INT NOT NULL,
    Id_php_users          INT NOT NULL,
    CONSTRAINT PK_php_comment PRIMARY KEY (Id_php_comment),
    CONSTRAINT FK_php_comment_php_recipe FOREIGN KEY (Id_php_recipe) REFERENCES php_recipe (Id_php_recipe),
    CONSTRAINT FK_php_comment_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);

CREATE TABLE php_user_log
(
    Id_php_user_log         INT AUTO_INCREMENT,
    user_log_connexion_date DATETIME,
    Id_php_users            INT NOT NULL,
    CONSTRAINT PK_php_user_log PRIMARY KEY (Id_php_user_log),
    CONSTRAINT FK_php_user_log_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);

CREATE TABLE php_paragraph
(
    Id_php_paragraph        INT AUTO_INCREMENT,
    paragraph_order         VARCHAR(50),
    paragraph_content       TINYINT,
    paragraph_creation_date DATETIME,
    Id_php_recipe           INT NOT NULL,
    CONSTRAINT PK_php_paragraph PRIMARY KEY (Id_php_paragraph),
    CONSTRAINT FK_php_paragraph_php_recipe FOREIGN KEY (Id_php_recipe) REFERENCES php_recipe (Id_php_recipe)
);

CREATE TABLE php_recipe_product
(
    Id_php_products            INT,
    Id_php_products_1          INT,
    Id_php_recipe              INT,
    recipe_ingredient_quantity SMALLINT NOT NULL,
    recipe_ingredient_order    SMALLINT,
    Id_php_unit_of_measure     INT      NOT NULL,
    CONSTRAINT PK_php_recipe_product PRIMARY KEY (Id_php_products, Id_php_products_1, Id_php_recipe),
    CONSTRAINT FK_php_recipe_product_php_ingredients FOREIGN KEY (Id_php_products) REFERENCES php_ingredients (Id_php_products),
    CONSTRAINT FK_php_recipe_product_php_tool_1 FOREIGN KEY (Id_php_products_1) REFERENCES php_tool (Id_php_products),
    CONSTRAINT FK_php_recipe_product_php_recipe FOREIGN KEY (Id_php_recipe) REFERENCES php_recipe (Id_php_recipe),
    CONSTRAINT FK_php_recipe_product_php_unit_of_measure FOREIGN KEY (Id_php_unit_of_measure) REFERENCES php_unit_of_measure (Id_php_unit_of_measure)
);

CREATE TABLE php_command
(
    Id_php_command        INT AUTO_INCREMENT,
    command_statut        TINYINT,
    command_creation_date DATETIME,
    Id_php_users          INT NOT NULL,
    CONSTRAINT PK_php_command PRIMARY KEY (Id_php_command),
    CONSTRAINT FK_php_command_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);

CREATE TABLE php_moderator
(
    Id_php_users   INT,
    Id_php_comment INT,
    CONSTRAINT PK_php_moderator PRIMARY KEY (Id_php_users),
    CONSTRAINT AK_php_moderator UNIQUE (Id_php_comment),
    CONSTRAINT FK_php_moderator_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users),
    CONSTRAINT FK_php_moderator_php_comment FOREIGN KEY (Id_php_comment) REFERENCES php_comment (Id_php_comment)
);

CREATE TABLE php_articles
(
    Id_php_articles           INT AUTO_INCREMENT,
    articles_quantity_by_unit SMALLINT,
    articles_statut           TINYINT,
    articles_creation_date    DATETIME,
    articles_updated          DATETIME,
    id_php_images             SMALLINT,
    Id_php_unit_of_measure    INT NOT NULL,
    Id_php_products           INT NOT NULL,
    CONSTRAINT PK_php_articles PRIMARY KEY (Id_php_articles),
    CONSTRAINT FK_php_articles_php_images FOREIGN KEY (id_php_images) REFERENCES php_images (id_php_images),
    CONSTRAINT FK_php_articles_php_unit_of_measure FOREIGN KEY (Id_php_unit_of_measure) REFERENCES php_unit_of_measure (Id_php_unit_of_measure),
    CONSTRAINT FK_php_articles_php_products FOREIGN KEY (Id_php_products) REFERENCES php_products (Id_php_products)
);

CREATE TABLE php_article_price
(
    Id_php_article_price       INT AUTO_INCREMENT,
    article_price_date_in_time DATETIME,
    article_price              DECIMAL(15, 2),
    Id_php_articles            INT NOT NULL,
    CONSTRAINT PK_php_article_price PRIMARY KEY (Id_php_article_price),
    CONSTRAINT FK_php_article_price_php_articles FOREIGN KEY (Id_php_articles) REFERENCES php_articles (Id_php_articles)
);

CREATE TABLE php_batches
(
    Id_php_batches         INT AUTO_INCREMENT,
    batches_unitary_price  DECIMAL(15, 2),
    batches_quantity_buy   TINYINT,
    batches_receiving_date DATETIME,
    Id_php_articles        INT NOT NULL,
    CONSTRAINT PK_php_batches PRIMARY KEY (Id_php_batches),
    CONSTRAINT FK_php_batches_php_articles FOREIGN KEY (Id_php_articles) REFERENCES php_articles (Id_php_articles)
);

CREATE TABLE php_details_command
(
    Id_php_command           INT,
    Id_php_articles          INT,
    details_command_quantity TINYINT,
    CONSTRAINT PK_php_details_command PRIMARY KEY (Id_php_command, Id_php_articles),
    CONSTRAINT FK_php_details_command_php_command FOREIGN KEY (Id_php_command) REFERENCES php_command (Id_php_command),
    CONSTRAINT FK_php_details_command_php_articles FOREIGN KEY (Id_php_articles) REFERENCES php_articles (Id_php_articles)
);

CREATE TABLE php_import
(
    Id_php_users   INT,
    Id_php_batches INT,
    import_date    DATE,
    CONSTRAINT PK_php_import PRIMARY KEY (Id_php_users, Id_php_batches),
    CONSTRAINT FK_php_import_php_admin FOREIGN KEY (Id_php_users) REFERENCES php_admin (Id_php_users),
    CONSTRAINT FK_php_import_php_batches FOREIGN KEY (Id_php_batches) REFERENCES php_batches (Id_php_batches)
);

CREATE TABLE php_rate
(
    Id_php_recipe INT,
    Id_php_users  INT,
    rating        INT,
    CONSTRAINT PK_php_rate PRIMARY KEY (Id_php_recipe, Id_php_users),
    CONSTRAINT FK_php_rate_php_recipe FOREIGN KEY (Id_php_recipe) REFERENCES php_recipe (Id_php_recipe),
    CONSTRAINT FK_php_rate_php_users FOREIGN KEY (Id_php_users) REFERENCES php_users (Id_php_users)
);
