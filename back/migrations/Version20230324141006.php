<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230324141006 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE author (id INT AUTO_INCREMENT NOT NULL, autname VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE book (id INT AUTO_INCREMENT NOT NULL, booeditor_id INT DEFAULT NULL, booname VARCHAR(255) NOT NULL, boosummary VARCHAR(255) DEFAULT NULL, boonb_pages INT DEFAULT NULL, boolink_img VARCHAR(255) DEFAULT NULL, INDEX IDX_CBE5A331D3E0B119 (booeditor_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE book_categories (book_id INT NOT NULL, categories_id INT NOT NULL, INDEX IDX_A55E0CDB16A2B381 (book_id), INDEX IDX_A55E0CDBA21214B7 (categories_id), PRIMARY KEY(book_id, categories_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE book_language (book_id INT NOT NULL, language_id INT NOT NULL, INDEX IDX_CD2467EC16A2B381 (book_id), INDEX IDX_CD2467EC82F1BAF4 (language_id), PRIMARY KEY(book_id, language_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE book_author (book_id INT NOT NULL, author_id INT NOT NULL, INDEX IDX_9478D34516A2B381 (book_id), INDEX IDX_9478D345F675F31B (author_id), PRIMARY KEY(book_id, author_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE categories (id INT AUTO_INCREMENT NOT NULL, catname VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE editor (id INT AUTO_INCREMENT NOT NULL, ediname VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE language (id INT AUTO_INCREMENT NOT NULL, lanname VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, usrname VARCHAR(255) NOT NULL, usrfirst_name VARCHAR(255) NOT NULL, usremail VARCHAR(255) NOT NULL, usrpassword VARCHAR(255) NOT NULL, usrprofile_picture VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_user (user_source INT NOT NULL, user_target INT NOT NULL, INDEX IDX_F7129A803AD8644E (user_source), INDEX IDX_F7129A80233D34C1 (user_target), PRIMARY KEY(user_source, user_target)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_book (id INT AUTO_INCREMENT NOT NULL, usbid_user_id INT NOT NULL, usbbook_id INT NOT NULL, usbgrade INT DEFAULT NULL, usbdate_borrowed DATE NOT NULL, usbdate_given_back DATE DEFAULT NULL, INDEX IDX_B164EFF869BAE77B (usbid_user_id), INDEX IDX_B164EFF823C41283 (usbbook_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE book ADD CONSTRAINT FK_CBE5A331D3E0B119 FOREIGN KEY (booeditor_id) REFERENCES editor (id)');
        $this->addSql('ALTER TABLE book_categories ADD CONSTRAINT FK_A55E0CDB16A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_categories ADD CONSTRAINT FK_A55E0CDBA21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_language ADD CONSTRAINT FK_CD2467EC16A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_language ADD CONSTRAINT FK_CD2467EC82F1BAF4 FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_author ADD CONSTRAINT FK_9478D34516A2B381 FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE book_author ADD CONSTRAINT FK_9478D345F675F31B FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_user ADD CONSTRAINT FK_F7129A803AD8644E FOREIGN KEY (user_source) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_user ADD CONSTRAINT FK_F7129A80233D34C1 FOREIGN KEY (user_target) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF869BAE77B FOREIGN KEY (usbid_user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE user_book ADD CONSTRAINT FK_B164EFF823C41283 FOREIGN KEY (usbbook_id) REFERENCES book (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE book DROP FOREIGN KEY FK_CBE5A331D3E0B119');
        $this->addSql('ALTER TABLE book_categories DROP FOREIGN KEY FK_A55E0CDB16A2B381');
        $this->addSql('ALTER TABLE book_categories DROP FOREIGN KEY FK_A55E0CDBA21214B7');
        $this->addSql('ALTER TABLE book_language DROP FOREIGN KEY FK_CD2467EC16A2B381');
        $this->addSql('ALTER TABLE book_language DROP FOREIGN KEY FK_CD2467EC82F1BAF4');
        $this->addSql('ALTER TABLE book_author DROP FOREIGN KEY FK_9478D34516A2B381');
        $this->addSql('ALTER TABLE book_author DROP FOREIGN KEY FK_9478D345F675F31B');
        $this->addSql('ALTER TABLE user_user DROP FOREIGN KEY FK_F7129A803AD8644E');
        $this->addSql('ALTER TABLE user_user DROP FOREIGN KEY FK_F7129A80233D34C1');
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF869BAE77B');
        $this->addSql('ALTER TABLE user_book DROP FOREIGN KEY FK_B164EFF823C41283');
        $this->addSql('DROP TABLE author');
        $this->addSql('DROP TABLE book');
        $this->addSql('DROP TABLE book_categories');
        $this->addSql('DROP TABLE book_language');
        $this->addSql('DROP TABLE book_author');
        $this->addSql('DROP TABLE categories');
        $this->addSql('DROP TABLE editor');
        $this->addSql('DROP TABLE language');
        $this->addSql('DROP TABLE user');
        $this->addSql('DROP TABLE user_user');
        $this->addSql('DROP TABLE user_book');
    }
}
