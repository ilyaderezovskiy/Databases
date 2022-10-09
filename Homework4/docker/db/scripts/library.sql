CREATE TABLE "Readers" (
	"id" serial,
	"first_name" VARCHAR(255) NOT NULL,
	"last_name" VARCHAR(255) NOT NULL,
	"address" VARCHAR(255) NOT NULL,
	"birth_date" DATE NOT NULL,
	"book_id" integer NOT NULL,
	CONSTRAINT "Readers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Books" (
	"id" serial,
	"ISBN" serial NOT NULL,
	"year" integer NOT NULL,
	"name" VARCHAR(255),
	"author" VARCHAR(255) NOT NULL,
	"page_amount" integer NOT NULL,
	CONSTRAINT "Books_pk" PRIMARY KEY ("ISBN")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Categories" (
	"id" serial,
	"name" VARCHAR(255),
	"supercategory_id" integer,
	CONSTRAINT "Categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BookCopies" (
	"id" serial NOT NULL,
	"shelf_position" integer NOT NULL,
	"copy_number" integer NOT NULL,
	CONSTRAINT "BookCopies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Publishers" (
	"id" serial,
	"name" VARCHAR(255) NOT NULL,
	"address" VARCHAR(255) NOT NULL,
	CONSTRAINT "Publishers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BookCategories" (
	"book_id" integer NOT NULL,
	"category_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BookPublishers" (
	"book_id" integer NOT NULL,
	"publisher_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "BookBookCopies" (
	"book_id" integer NOT NULL,
	"book_copy_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Readers" ADD FOREIGN KEY ("book_id") REFERENCES "BookCopies"("id");

ALTER TABLE "Categories" ADD FOREIGN KEY ("supercategory_id") REFERENCES "Categories"("id");

ALTER TABLE "BookCategories" ADD FOREIGN KEY ("book_id") REFERENCES "Books"("ISBN");
ALTER TABLE "BookCategories" ADD FOREIGN KEY ("category_id") REFERENCES "Categories"("id");

ALTER TABLE "BookPublishers" ADD FOREIGN KEY ("book_id") REFERENCES "Books"("ISBN");
ALTER TABLE "BookPublishers" ADD FOREIGN KEY ("publisher_id") REFERENCES "Publishers"("id");

ALTER TABLE "BookBookCopies" ADD FOREIGN KEY ("book_id") REFERENCES "Books"("ISBN");
ALTER TABLE "BookBookCopies" ADD FOREIGN KEY ("book_copy_id") REFERENCES "BookCopies"("id");