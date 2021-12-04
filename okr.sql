/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : okr

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 05/12/2021 02:22:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书的id',
  `book_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `img` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '书封面',
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `price` bigint(11) NULL DEFAULT NULL COMMENT '价格',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '借阅者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '谢特', 'data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUSEhMWFRUWFRgVFRgVFRcVFRcVFRUXFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OFxAQGi0eHyAtLS0tLS0tLS0tLS0rLS0tLS0rLS0tLS0rLS0tLS0tLS0tLS0tKy0tLSstKy0rNy0tN//AABEIANoA5wMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAFAAIDBAYBBwj/xABEEAACAgECAwcBBQUFBgUFAAABAgADEQQhBRIxBhMiQVFhcZEUIzKBsQdCcqHBM1JistEVJJKz4fBTc4Ki0hZDVWN0/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAECAwQF/8QAJREAAwACAgEFAAIDAAAAAAAAAAECAxESITEEEyJBURSRMkJh/9oADAMBAAIRAxEAPwD3GKKKACiiigApwmcLRYz1gBwnM6q4ncREwAjvuVFLOQqgZJPQCeU9r/2ksSa9L4F6F/3mHtnoI/8Aaf2nDH7PW3hB8WD1b3nmNq5mfLZtOPrbH6jiLuSSSSepJyTIVvM4KDJa9LHstS2T0ag+sJ6e/mODB9OkMLaHQnIMSaD2y7p2YfHpClGRhqyUceanB/6yDTaU83tCNWmIlbE40HuB9tHXwapcgf8A3FG/yyj9RNtptQlih0YMp6ETyYrg+8JcC4o+nbIOVJ8SeR9x6GNGbk9NilfQ6tbUFiHKsMj/AEPvLEZmKKKKACiiigAooooAKKKKACiiigAsxoacU5G8dADuZGXz+H6+UZyFuuw9P9ZMBADipiOiigAjMf8AtC7SfZauRP7Rwcew9ZrrGwCfTf6T5/7b8VN+psYk4yQPgSKfejTHO+wBqry7FjvneRqYkEeVxIfR1IcksVrIEMu6dZLZcotaUY6wtpng+hRCGmqkmgd0XQQkQMQdohtLpfAjTJpFTUpKjqR5y5ZbKruJsq6MGjR9iuJYsNPk45h/GMZ+o/SbcGeSaTWCq6qweTjPxnf+WZ60JSZzZFpjooooyBRRRQAUUUUAFFFFABRRRQA4J0SNs5GMY848QAQnYooAcMD8R7TaTTki2+tSOo5skfIHSF2nz9xRwOKXlwGC3scEZBw22RJdaei4Wz0TtN+0HT/ZrBQXZmUqjCtgmSMZDHaeG6q9iSckz03th2lXUadawgUjyAGOnUDynnjP8Sd7ZtK0uitp9ZjrLZ1QMq6hFIO28GKWj4pj5NINfagJ3/aoHnI+HaNGGW3OATn3liwVr0UfSJykUqZ2jjPvNHwLiwZsMRAFOnRuqj6SLX8LCqXrJUgZ2OItIrdeT1SvAG0TscTzXst2luQFGbnXy5tyPgzZ6DtHU2z+E++4kvG14KnKn0y67SjZZviXNRchHMrAj23gux8mStipb8Db28S/xCe20fhXPoP0nimlTmuqX1sQf+4T21ZtJy5fI6KczFmWZHYpDbqUX8TKPkiDddx/TqpAtXmOwwcnJ6RNj0F4pmdfqrFrrKu2SzA79cYlMcVvA/Gfzmij4qt+TSMVXvX0bKdmMu49euBkZx6TS6PUs/MNhjl/mob+svLhrGk39mCrbaL0UhCt5mKYbL0c53zjl29cyYSH7QM43kwMNgzsUY7gdZ0NDYiPU2BVyfiYbjXC614nptQVXkvDUWAgYNh3U/OBjM2XFEJQYUt4gcD284D7W6ZTonL5rNZFtbA7q6nKEe+ZFeTSDz/9pC1VOUpQL8fnPN7UJxkwpxjidlrZfc5O/wAwNZafQxT2bOdC1JwJHptK5XOI6qtrCB5AzZcJ4fhckRu+PRURyMtprCOQ+qlT8oSJGyMW6wjxXSdzYdsox5hjqpxgyutyHzAPvtDe+x8WhlCMv7x/pJNVq3CMD0Ix9Yjcv94fWWKae+Kqo8IOWP8AQRBr6IOF6DwjGeYwzTwPUN+Ff5zQcH4UMgkTUVVcu0n3DWcBgf8AY2trGRU5H+Egj6ZkTa5kIFish/xAj9Z6M15UQTqLTYeVgGU7EMMjHn1h7qB4WvAG4NxBVsruYZVHDH8t5qNX+1JR+CsfnvM+ug0lWUYsVJwN8cufIEf1gfV8NFVnJ1BHMpx1U9ITSfgyy4KS2w/qf2l6ls8gx8CCtR2r1tn7zfXEgqogPVcZYEgADBI33l+THQSt1mpf8Tn6kzvD1fvayzk4cbH5mdPE7m88D2El4bcxtTLE+Jf1j4jPeuKH7tP42/mBBythTzbnO0L2KCtedwLMn4Ky/qOE1v1GMnORNl6rHjwxNreznSqclVLMZq7SxzNboLmVm8DEMqMCBt+AA7zP8Y0HdNjqOo+Js+HHNVf8C/oJ2esqcmKHPg58LpZK5EFms5MHkff03il+KeXwf6de1+HcTsUU1IOERRGD+I8aooOLXCnGce0T0AQmT/aa5GiIHmwz8AE/0ket/aJpU2HM3wMCZzj/AGsXXUWIqcvL4uuSR0P6yLpaNYl8keaPTkxDQ5l0pKPEtURsDvM5Otom0umXmwDuOsPd8laYd1GfUzH0XtzhvOXb2F2xHyYUVFaNBfw5XTmDBpnW0wJx/SFOGoak5F6H18pSccrYMSei3pjaNAM9JoOH6TptKWkEN6TbeQ60VMoLaPwCW11EF95JamkbNtIt3WZlDX3CmvnPrLWZHxUBqghXm5iAB7xD0CEupsDAPjnG2R0bylYEsic3UFl+hi0PAmW0mwbLkovqf3eks2Jyty+g3+ScmaSiM9pY9ESJMXrafE5/xGb4iYvXpvZ/Ef1nRJ5dAhTL3Bx96ufIj9ZSRf8AvMv8LXxjGTuOgJltoSR9F8P/ALPpndc/QS0+rKnDIQPUbyPgO9f5Kf5S+ZhkyJQk52ZVO7b2AuO6bmQ2dev6bQnwt27uscu3djfPngbYkmtr5qnHtGcKcClMkfh8zOtXzwL/AIzOZ1bLRc+h/lOyF+IVDrYg+WEUyNdP8JK9WjHCsCfaSFvYzwzsR21bT3E3lnRwFJ6lMZPMB5z1HTX6myqw9/XlgrUvWhwEY7Eg9TKYNGgLN6D8zPPv2oaV8125XGCvTzzmFON8H1X2c41j95sQxPKOu4wvliZqnR26rhoVnLWC+zdmznlOOvpiY3W1ouJ7MDc2+7fQQhwBvvQOoYFD8NC2o7D3Kpc4YAZblORD3ZXsYr0pfzkMcnGNtukT00arp9mC4kvISPQmAnqLHJml7SabltZT6nPzMzxDUlRhYoNqJaqsS1pExt5wfpNUdsjP9JfS1SpODnywZbSImgnWhjNVXneD9NxjkwGU8sLJarjmXpM2bJ7JNCsL1QbphvCKGZ0byS5luiUhLVBkF7LOZDp+IKX5SOh2PvJLOkl4TwiuzLO/d77e/rGhOtF7Q1Zc5IOR4fY+sq//AEoC3M1rEk56AQ/pdDVXstqk+pO8sNVts9ZP8UtUcuV83rQGTgVY65P5x+m7FaU5LVA5OTzEnP5Zhxa+WrvTufQdJTbjBHRYVk0TjwPIvih9XZvSp+HT1D/0D+suLpEUHlRRt5KB/SC3403kBK9vHXHpI903n0WT8NRwQ+E/l/WO1NnOwCkqQdjn+REo8L1QWrnc4BVd/wCIkSrqNSudm25/I74x6Tol/A4FMvK4ZorEzWQTuQRPP+1/hqXBbIp9cDAs/WasautqXAfkAP4ic++Zn+L6VNTUvI4bNLKpzgEh8/TwzV0va6M8e1m0ebG1uu+PM42+sUI36+zT6YVBuU2tzkYzhR03PqROzFHY2Yml/Yz6A7OnGko2OTRX8DB/6wNr+zGnrqYBQGwDnAhpNSqrUi/+EMD2BirM3PRnOHbCevfvEK9MiBuH8HFNa1qxI53ff/H1Eum9j+6cYjHuxOd1X9ms4tdE9ekzW65GCPSWuzwHcqAAMZGAMDYmRVX8i8zDY7fWXdFTyrge5+pzNppr62c+VeTyb9pehKapmAwrDmHyeswd2i5vme7duuDd/SXA8SAn3xPE9QCGMJp776NcbTkpjhze0n0vDmO231nQ7GWtKpB6zRs1SRPTwpf3sGXq9MAMAYjKiTLlSTJs1SQyqrEspFiItIZaWh4k9byi1sdXbvEPYXQZENaHQlqxgecDcP3mh0+s7qskLzb/AK7Q1sTtz2jg4Y06OGNKVnaVzsFUHO2c4j043aoy4G258touIv5VmkpoYacAYznz+YLu4Vk5B29IRo1RbSiwbEnP1Mzut4uynIJ/pLuE9HNiy3LbX6XDwjP70H38L38LZ+YP4p2guZeWvCsSMN1+RiUuE8WvLYdwTzYOwz1iWNI3fqcmn2bsaL/dWUgbou4JOcHPn0juF6RSihgGxnOw/LJl6986Yny5Af57wdoNagHK2evlF6lU5+J41XSzJlPtLwtO5auvw8zb79dugmNXiLaVK0VckI4yfLxHy89jN/xu0NV4SG39M7+W0807RFvBtk+PP1H/AHiZemdf40bxj0+ZldfxNHcli2fjYYGMD2igjWY5jsesU9BJFOmfQOosN/3aY3239QJNpeGN3iIceCoK3zmQcOrKENkDBJ67w3o7w9pYea4+k4cW3PyOrNSivh+F2rS4A9QMSnbwsk5yPpLIDczemDyySsNyEHridXtqkjjWSpfkg1eg50Cg4wQfoZcD42kFNZ5QGzkHPWdtnL6rLWGdwLbrpkltox0z6zxfttwA0XFlB7tySpx0yd1nsLH2zKt2nSwFXUFT5EZnD/OyNp0jbHqTwXupa01c9H452O0QUuzGn35tvjBnmmsuqDuKHZ1Q8vMwAz74HlPQw5XkXg6FU+QnWoElbUKJnRqW9Z0WsfOa8SuYdOtEgt1wg1EzJ008WiuWx/2gmEdCmZW0+mEL6SqTRSCmjGAIXq5WUo26sMH1/L3gmmW1swI5ZVLaMvxO+9FNyDvUqLV3qfxEKcLap/vYIzJdJ2jW1BRcrVjor7NgH+8fOUb+Kd3p7m/8Sx8D2Jx/SZVNafMzqUpo8/NXF6PcOEFhV3ecqp2I6FfIiDbaRYrIB4skp7kblfpPOeE9oLUPgfBxtndSPQiaThvahHID/duGznquZFY2KciHuuMEjzlfg9f3pP8Ai/rD/EkVvEpBBwTjyJ6zNVcVSi5lPiOdlHXqJFSzXmj1p6y+nITGWUD43wZQ0/BBUvjcl2JzvtjPkPiW+Ca4WUqcFfCckjEs6bVrYg3yw2OPIzfEtHN9mP4/rxpOZG5ipGQ3n6iYpreetX9XsO/uQZ6j2t0SW1b4IrBP5kYAzPM9bQKaK1PXnbOPUiFY15NE9oqcG4Gt7FSB5nf5inNLaRuoP5HBinNXLfQaNLrdfYocjHhcruMbCGuw+udjcXI8OAPzGYD4gB3d2N/vG/zCT9lrytlyDzIJ/wCGH+prEc60buvV5ZQTsTvLJqQMFB23J8R6/WAaFBOGOJytAW5c7EzPHSha1s1v06309BO+/ksKqcLseuesuNZkDfbA3+ZmLLiGwFyM4znyzgSDtN2o02jXGe8swfAG6HG3M3lvE557JyY5lT2amxlrBZ3AUb5JwPzmJ7RftCrrRloPMwyC/wC6D/h9TPLOPdrL9SxNjYXoEX8IH9fmZ/U6snA8hFh9Ck90c9UkzQcZ7Q2Wks7s2OmSTlj7e0qcMtyrHzLfpAd1ucfWXuF3/u+89DgpWkRFbYbrlisStUZarMwZ0k9YlygyiHxJqr95BpLC1AhDTiB6L4Q0+ombRsmF6zK3GtZ3dLt58pA+TsJxdSANzMR2r4+LD3SHYHc+p3lxDbIyZVKB3FddzBawdkGD7t5mDWskXNEu5nelo8u7dPZd01uJcS/MFM0clsCDS6DillX4W28wdxLyDTXvzsGqsPVlO38+ky1N8u02Q4orkz1LhXaCvSVhbe9sTGC/4lwfYdJe0PaLRWXm1L1HMMYOV6DHSeZaDiVlf4TkeYO4MJaRNJefHXyP7EgH4xI1rwXNnpJ1NXcWVhwTuVOc82TkTzztPquRQMqTzE9eg5fSSHs7g5RrFHkFfb+cE9oOGdw5Quz+APlsZ33xtE22a8kDhxUr+DDeuRiKBbLPPpFGpM2z1HiWjsqBAsLBslsAYEr9l7CbrMkkkDeTanRt6kj0h7hei01dHennFmMEE9T5bek5VS0ehfpqhpz3sroSdQFJOMdMy/x5lqFLdACS3wIE4jxyvTsLXALcuFUHc/Pp8zA8f7WWXtknbyA6CKMfPsnNTxPTe2aPtV20ewGur7qvGDjHeN8n90fE851mryTvItRqi0pO065hI4KyNj2eRkzmYsyzMcTO0WkNmMzOiDQJ6NDpNWDLX2mZqqwiWU1MxcHTOToOnVxi6vB6wWt8TWSeBXNGh0+vk78YCjrMr9oxInuzGsYPPoK8T409g5QcL7ecEc0YWiUTZTo5at0+yQSTMjWOMokRjS06ZE5iQE9dkt06iCw8lRowD1OoEuJYDM/VZLtF+IgNdwrjjphWOV9fMf6yftEe+sFq7oagMj+8M5B95maboQ0mqK9Oh6qehHv/AKxcSlRk7tz+Z/WKFuJcLAw1eSreXmh64J8xFGM9MruzYWyOU9IN7W9ol04C7Gw/hAOwBHUyfi+uqpTnyD6Y9cZnkPFeItdYzsdyf+8Thx4XT7PY9R66FK9vyTcQ4k1jFmYknzMHtYTGc04TO5Sl0jx6p09sTNGzpjTDRIjORRQ0I6YhORQAeDORRRi2PFhj+8MijliK2yURRoMfAQhETOExgMYEymOBjFjgYAOJkbiOzGtACKPUxo6xZgIsK8s1WQfzSettoDCVV0u0amB632k1dkANHptTjoZyCKb8RQHtjO0vEw9ndpslahcZ6sd3P1meaIuWYk9Sc/XeJopWh0+xCcM6JxusYhNOSRUJ2AyfYZMlt4faoy1TqMgbow3YFlGCPMAmAipFJKqyxCqCxPQAZJ+B5x40lh5SK2PPzcmATzcn48Dzx5xAQTonakLEBQWLdABkn4HnJU0th5SEY8/NyYGebk/HgeeMHPpACITuI/TUs5CopdicAKCSc+mJINM/Nycjc+eXl5Tzcx6DHrDYFeOBju6YsVCsWGcqFJIx1yB0nV0zksORsovMwwQVUY3IPQbj6wEJZJI0M6WgAnMaBOGTPQ45gUYFMc+R+Hmxjm9M5EBjQY4GMqUsQqKWYnACjJOfTEnq0lpziqw4ODhGOD6HA2PSADJxjO2AqSGBUjqGBDD5U7xWVsFVyDytnlbGxK7Ng+0AI0jTJKlJ2AJJOAB1JOwGIvs75YcjZQEvt+EA4Jb03jAjJktJ8MgJlhamFfOVIUkgN+6SuMge4yPrACShtpKrSnpXlkQAtI8UgR4oAC16x7xg6y5TpuYEk4Vccx9M9AB5k+kQFYQ/qKQD3fIgrKr3ZyOZvDzF89TvkYlOnW1KvL9nRgBuSW5j+Y6R9zVu6W8wSsADl6sCo/DgeXXeGytFvsTqgmqrGLeZ3RR3RUZHOM86lSSuwO3oZo20gPe1ivVC77ZTYuba+fx99Wr5weVB0OegMA9nrbNPZ3mbhSCHY0KCX5SGVST+FSCQcGP4NxuqtrcV3c2qFldzh8MiOxINK5wWGx5m9wItkvoh4NxZKdTbgBWsvr5bWFT90otbvnB5cZwQQQPKa7iGseqp3W5BhLO4J+yuLCWAZQqpnDb5mV0I7q219PUygpbVVzEFk5lCo5J2yMZ29faF9Pxy5fs5ta1lp7w3Ad395lwyDfbGAQfmTyRPJA/Ta5atRZbWq199ZV3bFayKED5dlB2XIYHYbTSa/WtXWzrcg8Fh07E6V1sJYBgFVM4OTmZHhXGCLGZFwStgUjB5GsBCsM7bbQye0tifZ+8ewpUX7xQK/vMvzIMttjoD0iVC2P7O3IOIh60C94chAOmPFgFdk2Un3zDNenY6rvksADt3hVQQ6d1uFz0fmGevTAnn3DuIim2y0oWbDd2A2Athbws3KdwASNoe03bJSKFesAJ3guKA85DMSgQ84/dwDnpmUikUey1z3Xauz7xmfTM/3bKlu99PRzsMDaFuJXpW+qazT85XQ05Ntjc/jFQ5HKMASeuRvtAfB7EQ3hKRYHQoFNhQLXziwZwMsfCgzn1hGzXrqK1rdOUOUFhqQf2NI+5RQTucnJLH90Q2kJsF8Q4RUdVdWttOmReQqLnfHiQMVVsEnGfOc/2BX/8AkNF/x2f/AAlftFd3mpsfHKGbIU7kDoAfcAASgVxGmmGw3wHhebtQilLgumt5XT8Bc8vIVLY3zNJruVr9aEo09xZK2StLcmzltXx2APuR6bbTDcOtRbA1nPhdx3YRjzDpkWbEe0Pt2lqIKk34IIONPoxsRjqIyiz2RQ06vVPYaksrr5xykioW5VhWOVwOu3Lk5xNIyFW1RStrFfS0vYVc7sbKyKq8u3iLEjrsAPSef8D4sula5052JQrUGWs7no9mcjK7kAdTDtnaWlntcXWr3gA5e4X7tcgsFKuo3xgnrjPSAEvENc6cS1iAVq1hr52dwgQKEZwrEE5I8OwzDevdhUjqzisBu9stuCLQx/CTWU5sN5DGTMcvHUGss1Ki3lcYAXu0bPKF6nm5F28vEPWELO1IFDVCvmFrKban/s+VQx2sJL2WsWBNh6cgx1MAIuBaxrtRqNUtdPepWLK+9wKhYpSsOebGCRk+2ZPxi86cX9zRSbHoptvB5bK+Rslu6QZzl/Exz5QLodbTWbx3LPXbXyKjWYYeJWwzr5bHcRmq11V9ys4tpqFK1MKzzvhFIIyxGQ3vAWiHtUirq7AihV8BCrsoLU1s2B5DJMI8W0RXhekf/wDbczjzVbiO6Yj0bu2x8SnqOI6e3VW3312FGOUqRlXmwAio7/uryqM43ir7RsbbLLq1eu1RXZT+FO6XHdqn9woRlT659YwA2nMu5wJWtNfenuefu8+HvMc4HoeXY/Mm1LQGcRopxOkUAKpXeabWclTDT7YqrHPt1ufBZj8AgD0mbB8S/wAS/wCYTUcQH+86z+Nf1EGPQjSG0+ysByFObkyCxsVsfQGDu4ONk8s+XrjpmXqDsP8A+k/8iPUbN/A3+ZpDNCtpE1IGUu5FUHH3mF2bHLjpkk7SzpG76oWoo7zm7uw+Q25g+PcZkFo/3b8x/wAwy52Q/sLf46v8rRV1OxxKqtMl0N5Ga3/ED8Z95X4vUTy45tzggb5HvLuqUc+fPlMhc7flOWXswz4lN9Alae7vwg8LCd4q6rguObyAzj5Ms6T8I+TIOLjZZp9mX2U0QMDy0k46+Inb5kWnarnAZcLnfckwhoWP2a/f95ILsHiWa8iuRc74ZIqTpsDv09Pzmm4XYgTCry+HJXpv+cqcJUBDgY3Mbcfvm/8AKMwtkUynbp6y5e19y34V/QyyunofKLUVblJBOc5HQjMf2bQdcDPrjf6yzqz/ALxX8H9Yptp6On2V7fLZi2B6ekUMaVB352H9oPL3je0aAW7AD4GPOdCoyVAeJRDPCKlOMgHfzAmjqrUdAB+Qj5D5GHUGWGtyuMAb59/eWOOj79/y/SeldkdOg0YYIoY9SFAP1jbKns8pUD1+fUe+If1PZK4JzIyOeQWd2D96Kj0fk8xN5250qfYufkXn8Pi5Rzf8XWCdTtfpHGzlNGCw2Ygvggt1xjaNFNHmli7SKnoYU4+Pv7v/ADX/AMxgyjqfiUQ/JHR1lvVHcSmvWWtR5fEAO5ijRFAZ/9k=', 'jisdf', 114514, 0, 20, NULL, '2021-09-08 22:34:11', 0);

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_id` int(11) NOT NULL COMMENT '书id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_tag
-- ----------------------------

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0未归还 1已归还',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_user
-- ----------------------------

-- ----------------------------
-- Table structure for csdn_spider
-- ----------------------------
DROP TABLE IF EXISTS `csdn_spider`;
CREATE TABLE `csdn_spider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `view_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击量',
  `article_detail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csdn_spider
-- ----------------------------
INSERT INTO `csdn_spider` VALUES (76, '❤️爆肝十二万字《python从零到精通教程》，从零教你变大佬❤️（建议收藏）', '3697', 'https://blog.csdn.net/weixin_46211269/article/details/120076709');
INSERT INTO `csdn_spider` VALUES (77, '❤️13万字《C语言动漫对话教程(入门篇)》❤️(建议收藏)', '8751', 'https://blog.csdn.net/WhereIsHeroFrom/article/details/120050238');
INSERT INTO `csdn_spider` VALUES (78, 'Python爬虫实战之爬淘宝商品并做数据分析，现在赚钱没点技术还真不行！', '3660', 'https://blog.csdn.net/zhiguigu/article/details/120061978');
INSERT INTO `csdn_spider` VALUES (79, '⭐超详细图解Linux安装⭐', '1155', 'https://blog.csdn.net/weixin_45766180/article/details/120082128');
INSERT INTO `csdn_spider` VALUES (80, '详解linux中rsync的妙用', '125', 'https://blog.csdn.net/weixin_53488443/article/details/120085223');
INSERT INTO `csdn_spider` VALUES (81, '❤ CSDN精心打造一款插件，让你的浏览器：解锁黑科技、个性十足、沉浸式体验 ❤', '1082', 'https://blog.csdn.net/weixin_39032019/article/details/120066606');
INSERT INTO `csdn_spider` VALUES (82, '如何管理你下载的一大堆Python包【❤️win环境及linux环境下创建虚拟环境详解❤️】', '692', 'https://blog.csdn.net/qq_44907926/article/details/120082981');
INSERT INTO `csdn_spider` VALUES (83, '【❗划重点！C语言函数参数传递只有两种方式（值传递，地址传递），不支持“引用传递”！❗】', '1488', 'https://blog.csdn.net/zcc1229936385/article/details/120028154');
INSERT INTO `csdn_spider` VALUES (84, 'TCP协议为什么需要三次握手？', '957', 'https://blog.csdn.net/u014427391/article/details/120064699');
INSERT INTO `csdn_spider` VALUES (85, '项目配置不当引发了数据泄露，人已裂开！！（建议收藏）', '2841', 'https://blog.csdn.net/l1028386804/article/details/120052914');
INSERT INTO `csdn_spider` VALUES (86, 'JavaScript数组常用的方法总结', '2830', 'https://blog.csdn.net/weixin_41937552/article/details/120050650');
INSERT INTO `csdn_spider` VALUES (87, '哔哩哔哩面试官：你可以手写Vue2的响应式原理吗？', '986', 'https://blog.csdn.net/MrWeb/article/details/120064225');
INSERT INTO `csdn_spider` VALUES (88, 'JavaScript教程带你快速入门', '316', 'https://blog.csdn.net/weixin_53790347/article/details/120058457');
INSERT INTO `csdn_spider` VALUES (89, '【 JavaSe 】 程序逻辑控制', '255', 'https://blog.csdn.net/CS_z_jun/article/details/120088597');
INSERT INTO `csdn_spider` VALUES (90, '❤️只用一个脚本做一个 刮刮乐 案例，一不小心刮出来一个女朋友！❤️【学习娱乐一下】', '3298', 'https://blog.csdn.net/zhangay1998/article/details/120047305');
INSERT INTO `csdn_spider` VALUES (91, '【Python】一文弄懂python装饰器（附源码例子）', '466', 'https://blog.csdn.net/zhh763984017/article/details/120072425');
INSERT INTO `csdn_spider` VALUES (92, '⚡每日肥学⚡——算法&面试题2️⃣', '109', 'https://blog.csdn.net/jiahuiandxuehui/article/details/119763830');
INSERT INTO `csdn_spider` VALUES (93, '熬夜爆肝！C++核心STL容器知识点汇总整理【3W字干货预警 建议收藏】', '723', 'https://blog.csdn.net/hhladminhhl/article/details/120073394');
INSERT INTO `csdn_spider` VALUES (94, 'Python介绍', '137', 'https://blog.csdn.net/weixin_52632755/article/details/119957164');
INSERT INTO `csdn_spider` VALUES (95, '爬取淘宝上4000条月饼数据，制作了一个酷炫的可视化大屏！', '1236', 'https://blog.csdn.net/weixin_41261833/article/details/120061974');
INSERT INTO `csdn_spider` VALUES (96, '❤️吐血总结《Mysql从入门到入魔》，图文并茂（建议收藏）❤️', '110', 'https://blog.csdn.net/qq_43965708/article/details/120037528');
INSERT INTO `csdn_spider` VALUES (97, '深度学习基础之numpy，小白轻松入门numpy，送书了！！！', '660', 'https://blog.csdn.net/perfect2011/article/details/120073767');
INSERT INTO `csdn_spider` VALUES (98, '程序员需要达到什么水平才能顺利拿到 20k 无压力？', '2612', 'https://blog.csdn.net/weixin_52710450/article/details/120066139');
INSERT INTO `csdn_spider` VALUES (99, 'Java文件上传实例并解决跨域问题', '158', 'https://blog.csdn.net/promsing/article/details/120089365');
INSERT INTO `csdn_spider` VALUES (100, 'VirtualBox打开虚拟机失败，Not in a hypervisor partition(HPV=0)(VERR_NEM_NOT_AVAILABLE) ，但是没有virtualization选项', '284', 'https://blog.csdn.net/qq_41798899/article/details/120072017');

-- ----------------------------
-- Table structure for key
-- ----------------------------
DROP TABLE IF EXISTS `key`;
CREATE TABLE `key`  (
  `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 钥匙id',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钥匙名称',
  `status` tinyint(1) NOT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key
-- ----------------------------
INSERT INTO `key` VALUES (8, '四教111 是学生', 0, NULL, NULL, 0);
INSERT INTO `key` VALUES (10, '四教112 二十四岁', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for key_user
-- ----------------------------
DROP TABLE IF EXISTS `key_user`;
CREATE TABLE `key_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key_id` int(11) NOT NULL COMMENT '钥匙id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0暂保管 1已归还',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key_user
-- ----------------------------
INSERT INTO `key_user` VALUES (8, 8, 22, 1, '2021-10-08 00:45:17');
INSERT INTO `key_user` VALUES (9, 10, 22, 1, '2021-10-08 00:46:02');
INSERT INTO `key_user` VALUES (10, 8, 22, 1, '2021-10-08 00:48:28');
INSERT INTO `key_user` VALUES (11, 10, 22, 1, '2021-10-08 00:49:19');
INSERT INTO `key_user` VALUES (12, 10, 22, 1, '2021-10-08 00:56:12');
INSERT INTO `key_user` VALUES (13, 8, 22, 1, '2021-10-08 00:56:21');
INSERT INTO `key_user` VALUES (14, 8, 22, 1, '2021-10-08 00:56:43');
INSERT INTO `key_user` VALUES (15, 10, 20, 1, '2021-10-08 00:57:22');
INSERT INTO `key_user` VALUES (17, 8, 20, 1, '2021-10-10 03:15:27');
INSERT INTO `key_user` VALUES (18, 10, 20, 1, '2021-10-10 03:15:28');
INSERT INTO `key_user` VALUES (20, 8, 20, 1, '2021-10-15 00:16:00');
INSERT INTO `key_user` VALUES (21, 8, 20, 1, '2021-10-15 01:54:35');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(11) NOT NULL COMMENT '主键',
  `parent_id` int(11) NOT NULL COMMENT '父路径id，id为0代表为父路径',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本内容',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'icon类型',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'icon大小',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `external` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链',
  `hidden` tinyint(2) NULL DEFAULT NULL COMMENT '隐藏0 不隐藏1',
  `role_id` tinyint(2) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1001, 0, '/home', 'home', '主页', 'md-home', '18', '/Home', NULL, NULL, 3);
INSERT INTO `menu` VALUES (1002, 0, '/userinfo', 'userinfo', '用户信息', 'ios-time', '18', '/UserInfo', NULL, NULL, 3);
INSERT INTO `menu` VALUES (1003, 0, '/member', 'member', '成员管理', 'md-person', '18', '/Member', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2000, 0, '/book', 'book', '书籍管理', 'ios-book-outline', '18', '', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2001, 2000, '/booklist', 'booklist', '书籍列表', 'ios-book', '18', '/Book', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2002, 2000, '/bookuser', 'bookuser', '借阅记录', 'md-book', '18', '/BookUser', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3000, 0, '/key', 'key', '钥匙管理', 'ios-key-outline', '18', '', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3001, 3000, '/keylist', 'keylist', '钥匙列表', 'ios-key', '18', '/Key', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3002, 3000, '/keyuser', 'keyuser', '借阅记录', 'md-key', '18', '/KeyUser', NULL, NULL, 3);
INSERT INTO `menu` VALUES (4000, 0, '/okr', 'okr', 'okr管理', 'ios-egg-outline', '18', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4001, 4000, '/okrlist', 'okrlist', 'okr列表', 'ios-egg', '18', '/Okr', NULL, NULL, 3);
INSERT INTO `menu` VALUES (5000, 0, '/admin', 'admin', '系统管理', 'ios-lock', '18', '', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5001, 5000, '/sysrecord', 'sysrecord', '操作记录', 'ios-time', '18', '/SysRecord', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5002, 5000, '/signup', 'signup', '报名管理', 'md-bookmark', '18', '/SignUp', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5003, 5000, '/resource', 'resource', '接口管理', 'logo-buffer', '18', '/Resource', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5004, 5000, '/tag', 'tag', '标签管理', 'md-card', '18', '/Tag', NULL, NULL, 2);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路径',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `status` tinyint(1) NOT NULL COMMENT '接口状态 0关闭 1开启',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1467193546766372874 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1467193546711846914, '删除书籍', 'GET', '/api/okr/book/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546720235522, '借书', 'GET', '/api/okr/book/borrow', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546720235523, '添加书籍', 'POST', '/api/okr/book/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546720235524, '上传书籍照片', 'GET', '/api/okr/book/changeImg', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546720235525, '修改书籍', 'POST', '/api/okr/book/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546737012737, '书籍列表', 'POST', '/api/okr/book/query', 'user', 1);
INSERT INTO `resource` VALUES (1467193546737012738, '还书', 'GET', '/api/okr/book/return', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546737012739, '认证测试', 'GET', '/api/okr/common/test', 'common', 1);
INSERT INTO `resource` VALUES (1467193546741207041, '用户退出', 'GET', '/api/okr/common/logout', 'common', 1);
INSERT INTO `resource` VALUES (1467193546741207042, '用户登录', 'POST', '/api/okr/common/login', 'common', 1);
INSERT INTO `resource` VALUES (1467193546741207043, '模糊查询姓名列表', 'GET', '/api/okr/enum/name', 'user', 1);
INSERT INTO `resource` VALUES (1467193546741207044, '模糊查询钥匙', 'GET', '/api/okr/enum/key', 'user', 1);
INSERT INTO `resource` VALUES (1467193546741207045, '模糊查询用户名列表', 'GET', '/api/okr/enum/username', 'user', 1);
INSERT INTO `resource` VALUES (1467193546741207046, '模糊查询专业列表', 'GET', '/api/okr/enum/major', 'user', 1);
INSERT INTO `resource` VALUES (1467193546741207047, '模糊查询角色', 'GET', '/api/okr/enum/role', 'user', 1);
INSERT INTO `resource` VALUES (1467193546741207048, '增加钥匙', 'GET', '/api/okr/key/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546741207049, '根据id查询钥匙', 'GET', '/api/okr/key/queryById', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546749595649, '还钥匙', 'GET', '/api/okr/key/return', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595650, '修改钥匙', 'POST', '/api/okr/key/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546749595651, '借钥匙', 'GET', '/api/okr/key/borrow', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595652, '钥匙列表', 'POST', '/api/okr/key/query', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595653, '删除钥匙', 'GET', '/api/okr/key/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546749595654, '增加钥匙持有人', 'GET', '/api/okr/keyUser/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546749595655, '钥匙记录列表', 'POST', '/api/okr/keyUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595656, '删除钥匙持有人', 'GET', '/api/okr/keyUser/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546749595657, '获取路径', 'GET', '/api/okr/menu/fetch', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595658, '服务器监控', 'GET', '/api/okr/monitor/server', 'user', 1);
INSERT INTO `resource` VALUES (1467193546749595659, 'csdn实时展示', 'GET', '/api/okr/rank/csdn', 'common', 1);
INSERT INTO `resource` VALUES (1467193546757984258, '更改接口开放状态', 'GET', '/api/okr/resource/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984259, '获取资源接口', 'POST', '/api/okr/resource/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984260, '导出报名单', 'GET', '/api/okr/signup/export', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984261, '报名结果查询', 'GET', '/api/okr/signup/query', 'common', 1);
INSERT INTO `resource` VALUES (1467193546757984262, '获取报名记录', 'POST', '/api/okr/signup/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984263, '纳新报名', 'POST', '/api/okr/signup/add', 'common', 1);
INSERT INTO `resource` VALUES (1467193546757984264, '更新报名记录', 'POST', '/api/okr/signup/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984265, '登录日志列表', 'POST', '/api/okr/sysRecord/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984266, '更新标签', 'GET', '/api/okr/tag/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984267, '增加标签', 'GET', '/api/okr/tag/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984268, '删除标签', 'GET', '/api/okr/tag/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546757984269, '获取标签列表', 'POST', '/api/okr/tag/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546766372865, '注册用户', 'POST', '/api/okr/user/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546766372866, '上传头像文件', 'POST', '/api/okr/user/changeImg', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372867, '更新用户信息', 'POST', '/api/okr/user/change', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372868, '根据账号选择用户', 'GET', '/api/okr/user/query', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372869, '查询用户列表', 'POST', '/api/okr/user/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372870, '修改密码', 'POST', '/api/okr/user/changePassword', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372871, '删除用户', 'GET', '/api/okr/user/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467193546766372872, '根据用户名选择用户', 'GET', '/api/okr/user/queryByUsername', 'user', 1);
INSERT INTO `resource` VALUES (1467193546766372873, '修改成员的角色权限', 'POST', '/api/okr/userRole/grant', 'superAdmin', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL COMMENT '角色id，主键，越高权限越少',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'superAdmin', '超级管理员');
INSERT INTO `role` VALUES (2, 'admin', '管理员');
INSERT INTO `role` VALUES (3, 'user', '普通用户');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1161, 3, 1001);
INSERT INTO `role_menu` VALUES (1162, 3, 1002);
INSERT INTO `role_menu` VALUES (1163, 3, 1003);
INSERT INTO `role_menu` VALUES (1164, 3, 2000);
INSERT INTO `role_menu` VALUES (1165, 3, 2001);
INSERT INTO `role_menu` VALUES (1166, 3, 2002);
INSERT INTO `role_menu` VALUES (1167, 3, 3000);
INSERT INTO `role_menu` VALUES (1168, 3, 3001);
INSERT INTO `role_menu` VALUES (1169, 3, 3002);
INSERT INTO `role_menu` VALUES (1170, 3, 4000);
INSERT INTO `role_menu` VALUES (1171, 3, 4001);
INSERT INTO `role_menu` VALUES (1172, 2, 1001);
INSERT INTO `role_menu` VALUES (1173, 2, 1002);
INSERT INTO `role_menu` VALUES (1174, 2, 1003);
INSERT INTO `role_menu` VALUES (1175, 2, 2000);
INSERT INTO `role_menu` VALUES (1176, 2, 2001);
INSERT INTO `role_menu` VALUES (1177, 2, 2002);
INSERT INTO `role_menu` VALUES (1178, 2, 3000);
INSERT INTO `role_menu` VALUES (1179, 2, 3001);
INSERT INTO `role_menu` VALUES (1180, 2, 3002);
INSERT INTO `role_menu` VALUES (1181, 2, 4000);
INSERT INTO `role_menu` VALUES (1182, 2, 4001);
INSERT INTO `role_menu` VALUES (1183, 2, 5000);
INSERT INTO `role_menu` VALUES (1184, 2, 5001);
INSERT INTO `role_menu` VALUES (1185, 2, 5002);
INSERT INTO `role_menu` VALUES (1186, 2, 5003);
INSERT INTO `role_menu` VALUES (1187, 2, 5004);
INSERT INTO `role_menu` VALUES (1188, 1, 1001);
INSERT INTO `role_menu` VALUES (1189, 1, 1002);
INSERT INTO `role_menu` VALUES (1190, 1, 1003);
INSERT INTO `role_menu` VALUES (1191, 1, 2000);
INSERT INTO `role_menu` VALUES (1192, 1, 2001);
INSERT INTO `role_menu` VALUES (1193, 1, 2002);
INSERT INTO `role_menu` VALUES (1194, 1, 3000);
INSERT INTO `role_menu` VALUES (1195, 1, 3001);
INSERT INTO `role_menu` VALUES (1196, 1, 3002);
INSERT INTO `role_menu` VALUES (1197, 1, 4000);
INSERT INTO `role_menu` VALUES (1198, 1, 4001);
INSERT INTO `role_menu` VALUES (1199, 1, 5000);
INSERT INTO `role_menu` VALUES (1200, 1, 5001);
INSERT INTO `role_menu` VALUES (1201, 1, 5002);
INSERT INTO `role_menu` VALUES (1202, 1, 5003);
INSERT INTO `role_menu` VALUES (1203, 1, 5004);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` bigint(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27889 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (27786, 3, 1467193546766372872);
INSERT INTO `role_resource` VALUES (27787, 3, 1467193546749595657);
INSERT INTO `role_resource` VALUES (27788, 3, 1467193546749595658);
INSERT INTO `role_resource` VALUES (27789, 3, 1467193546741207044);
INSERT INTO `role_resource` VALUES (27790, 3, 1467193546749595652);
INSERT INTO `role_resource` VALUES (27791, 3, 1467193546766372868);
INSERT INTO `role_resource` VALUES (27792, 3, 1467193546741207045);
INSERT INTO `role_resource` VALUES (27793, 3, 1467193546766372869);
INSERT INTO `role_resource` VALUES (27794, 3, 1467193546741207046);
INSERT INTO `role_resource` VALUES (27795, 3, 1467193546766372870);
INSERT INTO `role_resource` VALUES (27796, 3, 1467193546741207047);
INSERT INTO `role_resource` VALUES (27797, 3, 1467193546749595655);
INSERT INTO `role_resource` VALUES (27798, 3, 1467193546737012737);
INSERT INTO `role_resource` VALUES (27799, 3, 1467193546749595649);
INSERT INTO `role_resource` VALUES (27800, 3, 1467193546766372866);
INSERT INTO `role_resource` VALUES (27801, 3, 1467193546741207043);
INSERT INTO `role_resource` VALUES (27802, 3, 1467193546749595651);
INSERT INTO `role_resource` VALUES (27803, 3, 1467193546766372867);
INSERT INTO `role_resource` VALUES (27804, 2, 1467193546757984268);
INSERT INTO `role_resource` VALUES (27805, 2, 1467193546757984269);
INSERT INTO `role_resource` VALUES (27806, 2, 1467193546766372872);
INSERT INTO `role_resource` VALUES (27807, 2, 1467193546741207048);
INSERT INTO `role_resource` VALUES (27808, 2, 1467193546749595656);
INSERT INTO `role_resource` VALUES (27809, 2, 1467193546757984264);
INSERT INTO `role_resource` VALUES (27810, 2, 1467193546749595657);
INSERT INTO `role_resource` VALUES (27811, 2, 1467193546741207049);
INSERT INTO `role_resource` VALUES (27812, 2, 1467193546757984265);
INSERT INTO `role_resource` VALUES (27813, 2, 1467193546749595658);
INSERT INTO `role_resource` VALUES (27814, 2, 1467193546757984266);
INSERT INTO `role_resource` VALUES (27815, 2, 1467193546757984267);
INSERT INTO `role_resource` VALUES (27816, 2, 1467193546741207044);
INSERT INTO `role_resource` VALUES (27817, 2, 1467193546749595652);
INSERT INTO `role_resource` VALUES (27818, 2, 1467193546766372868);
INSERT INTO `role_resource` VALUES (27819, 2, 1467193546720235524);
INSERT INTO `role_resource` VALUES (27820, 2, 1467193546757984260);
INSERT INTO `role_resource` VALUES (27821, 2, 1467193546741207045);
INSERT INTO `role_resource` VALUES (27822, 2, 1467193546766372869);
INSERT INTO `role_resource` VALUES (27823, 2, 1467193546720235525);
INSERT INTO `role_resource` VALUES (27824, 2, 1467193546749595653);
INSERT INTO `role_resource` VALUES (27825, 2, 1467193546741207046);
INSERT INTO `role_resource` VALUES (27826, 2, 1467193546766372870);
INSERT INTO `role_resource` VALUES (27827, 2, 1467193546749595654);
INSERT INTO `role_resource` VALUES (27828, 2, 1467193546757984262);
INSERT INTO `role_resource` VALUES (27829, 2, 1467193546741207047);
INSERT INTO `role_resource` VALUES (27830, 2, 1467193546749595655);
INSERT INTO `role_resource` VALUES (27831, 2, 1467193546766372871);
INSERT INTO `role_resource` VALUES (27832, 2, 1467193546737012737);
INSERT INTO `role_resource` VALUES (27833, 2, 1467193546749595649);
INSERT INTO `role_resource` VALUES (27834, 2, 1467193546766372865);
INSERT INTO `role_resource` VALUES (27835, 2, 1467193546766372866);
INSERT INTO `role_resource` VALUES (27836, 2, 1467193546711846914);
INSERT INTO `role_resource` VALUES (27837, 2, 1467193546720235522);
INSERT INTO `role_resource` VALUES (27838, 2, 1467193546737012738);
INSERT INTO `role_resource` VALUES (27839, 2, 1467193546749595650);
INSERT INTO `role_resource` VALUES (27840, 2, 1467193546757984258);
INSERT INTO `role_resource` VALUES (27841, 2, 1467193546741207043);
INSERT INTO `role_resource` VALUES (27842, 2, 1467193546749595651);
INSERT INTO `role_resource` VALUES (27843, 2, 1467193546766372867);
INSERT INTO `role_resource` VALUES (27844, 2, 1467193546720235523);
INSERT INTO `role_resource` VALUES (27845, 2, 1467193546757984259);
INSERT INTO `role_resource` VALUES (27846, 1, 1467193546757984268);
INSERT INTO `role_resource` VALUES (27847, 1, 1467193546757984269);
INSERT INTO `role_resource` VALUES (27848, 1, 1467193546766372872);
INSERT INTO `role_resource` VALUES (27849, 1, 1467193546741207048);
INSERT INTO `role_resource` VALUES (27850, 1, 1467193546749595656);
INSERT INTO `role_resource` VALUES (27851, 1, 1467193546757984264);
INSERT INTO `role_resource` VALUES (27852, 1, 1467193546749595657);
INSERT INTO `role_resource` VALUES (27853, 1, 1467193546741207049);
INSERT INTO `role_resource` VALUES (27854, 1, 1467193546757984265);
INSERT INTO `role_resource` VALUES (27855, 1, 1467193546766372873);
INSERT INTO `role_resource` VALUES (27856, 1, 1467193546749595658);
INSERT INTO `role_resource` VALUES (27857, 1, 1467193546757984266);
INSERT INTO `role_resource` VALUES (27858, 1, 1467193546757984267);
INSERT INTO `role_resource` VALUES (27859, 1, 1467193546741207044);
INSERT INTO `role_resource` VALUES (27860, 1, 1467193546749595652);
INSERT INTO `role_resource` VALUES (27861, 1, 1467193546766372868);
INSERT INTO `role_resource` VALUES (27862, 1, 1467193546720235524);
INSERT INTO `role_resource` VALUES (27863, 1, 1467193546757984260);
INSERT INTO `role_resource` VALUES (27864, 1, 1467193546741207045);
INSERT INTO `role_resource` VALUES (27865, 1, 1467193546766372869);
INSERT INTO `role_resource` VALUES (27866, 1, 1467193546720235525);
INSERT INTO `role_resource` VALUES (27867, 1, 1467193546749595653);
INSERT INTO `role_resource` VALUES (27868, 1, 1467193546741207046);
INSERT INTO `role_resource` VALUES (27869, 1, 1467193546766372870);
INSERT INTO `role_resource` VALUES (27870, 1, 1467193546749595654);
INSERT INTO `role_resource` VALUES (27871, 1, 1467193546757984262);
INSERT INTO `role_resource` VALUES (27872, 1, 1467193546741207047);
INSERT INTO `role_resource` VALUES (27873, 1, 1467193546749595655);
INSERT INTO `role_resource` VALUES (27874, 1, 1467193546766372871);
INSERT INTO `role_resource` VALUES (27875, 1, 1467193546737012737);
INSERT INTO `role_resource` VALUES (27876, 1, 1467193546749595649);
INSERT INTO `role_resource` VALUES (27877, 1, 1467193546766372865);
INSERT INTO `role_resource` VALUES (27878, 1, 1467193546766372866);
INSERT INTO `role_resource` VALUES (27879, 1, 1467193546711846914);
INSERT INTO `role_resource` VALUES (27880, 1, 1467193546720235522);
INSERT INTO `role_resource` VALUES (27881, 1, 1467193546737012738);
INSERT INTO `role_resource` VALUES (27882, 1, 1467193546749595650);
INSERT INTO `role_resource` VALUES (27883, 1, 1467193546757984258);
INSERT INTO `role_resource` VALUES (27884, 1, 1467193546741207043);
INSERT INTO `role_resource` VALUES (27885, 1, 1467193546749595651);
INSERT INTO `role_resource` VALUES (27886, 1, 1467193546766372867);
INSERT INTO `role_resource` VALUES (27887, 1, 1467193546720235523);
INSERT INTO `role_resource` VALUES (27888, 1, 1467193546757984259);

-- ----------------------------
-- Table structure for signup
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键',
  `student_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业班级',
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自我介绍',
  `status` tinyint(4) NOT NULL COMMENT '录取状态 0未查看 1已录取 2未录取',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评语',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signup
-- ----------------------------
INSERT INTO `signup` VALUES (1, '1', 'shit', '男', '12334', '挖掘机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 0, '团长 你就是个zipper', NULL, '2021-09-20 21:42:15');
INSERT INTO `signup` VALUES (2, '18110571234', '程成', '男', '501966782', '信管本2002', '熟悉golang。Java。cpp。vue。熟悉开源社区。github.com/devhg。熟悉Linux   ', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (3, '19111405056', '杨叶江', '男', '424133224', '工商1902', '目前属于基础检查，目标方向是为了能运用Python进行数据分析等，无项目经历。\n竞赛主要有省级三项，校级奖项若干', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (4, '19111407001', '宣佳栋', '男', '1413452856', '市销1901', '       在思想方面，本人理想信念坚定，积极向党组织靠拢。\n       在工作方面，担任班级学习委员，青年服务部工作人员，课程助理，市销2001班带班，积极为老师排忧解难。\n       在学习方面，学习认真努力，成绩优异，当前学业成绩和综合测评成绩均位于专业第一位，被授予校级“优秀学生”、“优秀共青团员”等称号，并获得校级二等奖学金。\n       在比赛方面，积极参加大型比赛，曾获：\n1.全国花间校园街坊总站国家级优秀奖\n2.“尖峰时刻”全球案例大赛省级一等奖\n3.全国大学生工程训练综合能力竞赛省级二等奖\n4.全国大学生市场调查与分析大赛省级三等奖\n5.“挑战杯”大学生课外学术科技作品大赛校级三等奖\n6.淄博市“创意青春 智赢未来”营销方案设计大赛市级二等奖\n7.山东理工大学青春踏歌行合唱比赛校级特等奖\n8.第一届山东理工大学创新方法应用大赛校级三等奖\n9.山东理工大学大学生科技创新大赛校级三等奖\n10.山东理工大学青年创客挑战赛校级优秀奖\n11.第三届全国管理模拟决策大赛校级三等奖\n12.第四届全国管理模拟决策大赛校级二等奖\n13.“庆国庆 青年行”爱国寻图比赛校级一等奖\n14.全国大学生电子商务“创新 创意 创业”挑战赛校级二等奖\n       在社会实践方面，两次获得社会实践校级奖项，被授予“社会实践先进个人”称号。\n       在科研成果方面，跟随导师进行小农户与现代化衔接方面的研究，自学SPSS分析、Java和citespace，并主持校级立项一项。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (5, '19111408015', '孙淼', '男', '1873365757', '信管1901', 'JAVA浅层次内容完成\nSQL语句浅层次\n周一上午\n周二晚上\n周三晚上\n周四下午晚上\n周五晚上', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (6, '19111408022', '杨光秋', '男', '1980820857', '信管1901', '1.现在在学java，感觉java想要深入掌握，是需要有专业老师教授。所以在专业课教学java语言和SQL Server，我希望能够通过信息技术实验室能另外掌握重要的python语言和c语言。\n\n2.我的目标是希望能够毕业掌握java语言，精通python语言和c语言，能够学到可以单人开发一些小项目小程序，能够有能力成为大项目开发团队的一员，甚至作为大项目开发经理。\n\n3.已经学完java语言基础、流程控制、数组与字符串（数据结构与算法分析学习完线性表、栈和队列）和Mysql的基础。\n接下去几周学习java语言类特性，继承、抽象类、接口和枚举，异常处理，java语言的输入输出与文件处理等，相关数据结构与算法分析，学习完mysql的基础内容。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (7, '19111408041', '曹渊博', '男', '2985958099', '信管1902', '目前java学完多线程，下一步想学一下算法，前端想再放一放在学，大二学生会也能退了之后就好好学习去了，实验室大概一个星期能去四次左右', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (8, '19111493015', '卢玉栋', '男', '2191387440', '信管本1901', '学了java流程控制，包括分支结构，循环结构，和跳转语句。定义数组与字符串。了解类，java输入输出与文件处理，学习了使用sql语句进行数据库管理，表的管理和应用，想从事大数据开发\n每周有时间就可以去实验室，白天有课，每天晚上可以去，周末', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (9, '19111493055', '陈建军', '男', '1727072639', '信管本1902', '了解Java、C、Python，了解SSM,SpringBoot框架，了解数据库的使用，会使用Git上传项目，会简单使用Linux操作系统，了解Docker容器，会使用ElasticSearch和Redis，了解Hadoop框架。\n目标方向是JavaWeb开发\n项目经历：1、微小型跨组织人才管理系统 2、绿色低碳出行微信小程序 3、员工管理系统\nCSDN: https://blog.csdn.net/qq_40266349?spm=1000.2115.3001.5343\nGitHub: https://github.com/JackYangyang0\n获奖：第六届节能减排社会实践与科技竞赛校二等奖且进入国赛', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (10, '19111493063', '王金浩', '男', '1253912723', '信管本1902', '大一学期专业课学过Java，上下学期考试均90分以上。基本例题都基本掌握。对python 感兴趣，目前已经开始学习！加入实验室的目的是想跟同学们一起交流学习，做一些创新性的事情。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (11, '19121406076', '王若冰', '女', '872184581', '工业1902', '目前初次接触python，系统学过计算机导论，熟悉较为简单的mathematica，接触过MATLAB，目标方向数据分析、算法优化，已取得四级证书、计算机二级证，大英赛二等奖，山东省数学竞赛三等奖，参与多项创新创业类竞赛，负责大创项目一项，对计算机软件学习保有热情，希望进步', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (12, '19121408037', '蔡春雨', '女', '1723612044', '信管1901', '获得计算机二级证书mysql数据库程序设计', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (13, '19121408074', '唐境锶', '女', '1945938350', '信管1902', '学过一些HTMLcssjs java mysql sqlsever 不是很厉害的那种程度 周四周天', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (14, '19121408075', '王梦瑶', '女', '1486102538', '信管1902', '目前掌握java的控制语句和方法内容，在进一步学习中，目标是能有自主开发编写程序的能力，暂无项目经历\n通过b站的java相关视频和csdn的相关知识自学', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (15, '19121493034', '贾聪聪', '女', '1541163933', '信管本1901', '自学Java', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (16, '2', 'shit', '男', '12333434', '挖掘机咕噜咕噜', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 2, NULL, NULL, '2021-09-08 16:17:09');
INSERT INTO `signup` VALUES (17, '20111405008', '刘浩伟', '男', '209478845', '工商2002', '我擅长C语言和一些基础算法，做一些算法题目，并且自学了数据结构(不过还没学完)，未来的目标是学习完数据结构和一些算法后，学习一些前端知识和计网知识，增加自己的技术面。除此之外，我也想参加一些比赛，如算法竞赛，关于计算机的比赛等，开阔自己的眼界。个人博客地址: https://blog.csdn.net/weixin_55812984。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (18, '20111407001', '周洪燊', '男', '2160915425', '市销2002', '自己对于编程掌握的不是很多，但是最近一直在学习python，对于python的一些基本规则和一些函数都有所了解掌握；自己目标方向就是可以全面地掌握编程，对于编程不同的种类技术都有所了解；自己没有什么项目经历，属于刚学编程的小白，但是自己可以学习，也相信自己会逐渐精通编程；自己的自学能力还算可以，对于新知识学得还算比较快，对于理科的一些知识学得会更快，理解得也会更快，因此我相信我会很快地融入到这个集体。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (19, '20111408012', '张义龙', '男', '568933962', '信管2002班', '个人暂时为java萌新，想学好java，暂时在刷山理工的oj和看哔站的教程，接触过citespace所以自己也想用java做出一个程序(如游戏)。对编程感兴趣，愿意去主动找到更多的资源去学习，让自己成长。去实验室的时间是周四周五下午可以去，下晚自习可以去。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (20, '20111408016', '马元麒', '男', '2804120991', '信管2002', '上学期学了HTML5、CSS、JS等等前端知识，已经会熟练制作静态网页，能对于一个现成的网页进行重新修改，并且学习了PHP，会对数据库进行基础操作，在寒假期间用php以及前端知识做出了自己的博客，可以实现增删改查，注册、登录、分页等等，但是还在本地保留，没有放到网站上（没有进行美化，太丑了）我也是青春在线程序部常驻志愿者，在那学习后端，laravel框架，网站构建知识，在寒假期间也参加了一个学长带队的互联网➕项目，在那里负责前端页面制作美化等等。我也学习java，前段时间刷了山东理工oj上的120多道题目，但是最近没做，最近一直在看bootstrape和js动态网页的制作，做了一个简单实时判断输入框输入内容长度的注册页面，准备再看看移动端网页适配的问题，我周一到周五晚上都可以去，周六在西校程序部培训学习，周天可能去西校做前端或者学网站搭建。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (21, '20111408050', '张森', '男', '1741927235', '信管2001', 'Language：Java, html, C（正在学）\nTarget：1.熟练运用Java和C,可以参加项目设计\n             2.深入学习算法和数据结构\n             3.可以独立制作，参加有水平的比赛\nTime：每天都能来实验室自习；\n           有课时如没特殊情况至少每晚都能来；\n           \n            ', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (22, '20121408020', '万蝶依', '女', '2433215310', '信管2002', '学习JAVA语言，在acm上做一些实验题，现在做到130道题目，对于编程有非常基础的了解，比较感兴趣，想要更加深入的了解编程的应用，将其快速的应用到现实中。寒假中对数据的处理有了一点点的了解。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (23, '20121408022', '韩雨欣', '女', '3240261856', '信息管理与信息系统专业2002', '目标熟练掌握JAVA。学习数据库', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (24, '20121408029', '曹雪', '女', '1369240484', '信管2002', '1.熟悉Java语言，有一定的Java基础。\n2.了解c语言，HTML，PHP，曾与伙伴合作写过一个网页。\n3.目前正在自学算法，数据结构，计算机组成原理。\n4.目标方向是web前后端开发(全栈)。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (25, '20121408039', '李贝贝', '女', '1410851521', '信管2002', '具有一定的自学能力，对制作网页及app具有较强的学习兴趣。希望自己可以独立制作出一个网页，或是app', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (26, '20121408061', '张玉洁', '女', '2889770573', '信管2001', '现在是大一阶段，正在学习Java、C编程语言，接触了前端HTML CSS，有一定的自学能力，目前还没有比较明确的目标方向，对编程感兴趣，准备继续学习数据结构及算法方面的知识，渴望与志同道合的小伙伴一起交流学习。如果能加入实验室大家庭，我应该每天都会来实验室学习。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (27, '20121408071', '曹琪', '女', '1138576292', '信管2001', '对计算机方向很感兴趣，想要进一步了解前端技术。虽然目前技术还处于基础阶段，但是我会很努力的。\n(去实验室的时间:只要是我没课的时候都可以去，包括假期我也都是留校)', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (28, '20121493080', '葛越荷', '女', '1787738998', '信管本2001', '主要学习JAVA相关知识，会不断复习学过的JAVA知识，并且开始学习一部分c语言知识。希望以后在研究生阶段进行学习软件开发的方向，所以会在大学开始就为考试做准备。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (29, '3', 'ass', '男', '12233334', '挖掘22机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (30, '114514', 'asefesf', '女', 'asefsefes', 'asefseaf', 'asefsef', 0, NULL, '2021-09-09 01:19:39', '2021-09-20 19:14:13');
INSERT INTO `signup` VALUES (49, '1145144', 'asefesf', '女', 'asefsefes', 'asefseaf', 'asefsef', 0, NULL, '2021-09-20 19:13:57', '2021-09-20 19:14:06');
INSERT INTO `signup` VALUES (50, '18111493050', 'lulinzi', '男', '1773950094', '信管本', 'asfjuiasefhiusehfwuoejrfiwjhfopasehfiposaehfiohsfkhiueahfiuasehfiuh哈覅u合肥欧服哈怂i返回覅u水分后期完结飞鸟无回复i啊瓦活佛i合法哦i是覅和', 0, NULL, '2021-09-20 21:48:50', '2021-09-21 01:39:55');
INSERT INTO `signup` VALUES (51, '123123', '1231231', '男', '123123', '123123', '', 0, NULL, '2021-09-21 01:28:20', '2021-09-21 01:28:20');
INSERT INTO `signup` VALUES (52, '123', '123', '男', '123', '123', '', 0, NULL, '2021-09-21 01:29:37', '2021-09-21 01:29:38');

-- ----------------------------
-- Table structure for sys_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_record`;
CREATE TABLE `sys_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '访问资源id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '请求时间点',
  `duration` int(11) NULL DEFAULT NULL COMMENT '用时 单位ms',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3946 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES (2834, 3102, 20, '127.0.0.1', '2021-10-21 00:45:39', 7);
INSERT INTO `sys_record` VALUES (2835, 3201, 20, '127.0.0.1', '2021-10-21 00:45:41', 1206);
INSERT INTO `sys_record` VALUES (2836, 3102, 20, '127.0.0.1', '2021-10-21 00:48:43', 19);
INSERT INTO `sys_record` VALUES (2837, 3201, 20, '127.0.0.1', '2021-10-21 00:48:44', 1228);
INSERT INTO `sys_record` VALUES (2838, 3201, 20, '127.0.0.1', '2021-10-21 00:52:04', 1167);
INSERT INTO `sys_record` VALUES (2839, 3201, 20, '127.0.0.1', '2021-10-21 00:55:24', 1152);
INSERT INTO `sys_record` VALUES (2840, 3102, 20, '127.0.0.1', '2021-10-21 01:00:38', 19);
INSERT INTO `sys_record` VALUES (2841, 3201, 20, '127.0.0.1', '2021-10-21 01:00:40', 1781);
INSERT INTO `sys_record` VALUES (2842, 3102, 20, '127.0.0.1', '2021-10-21 01:01:28', 14);
INSERT INTO `sys_record` VALUES (2843, 3201, 20, '127.0.0.1', '2021-10-21 01:02:00', 35879);
INSERT INTO `sys_record` VALUES (2844, 3201, 20, '127.0.0.1', '2021-10-21 01:04:48', 1224);
INSERT INTO `sys_record` VALUES (2845, 3102, 20, '127.0.0.1', '2021-10-21 01:08:34', 14);
INSERT INTO `sys_record` VALUES (2846, 3201, 20, '127.0.0.1', '2021-10-21 01:08:35', 1603);
INSERT INTO `sys_record` VALUES (2847, 3102, 20, '127.0.0.1', '2021-10-21 01:08:45', 6);
INSERT INTO `sys_record` VALUES (2848, 3201, 20, '127.0.0.1', '2021-10-21 01:08:47', 1171);
INSERT INTO `sys_record` VALUES (2849, 3601, 20, '127.0.0.1', '2021-10-21 01:09:51', 69);
INSERT INTO `sys_record` VALUES (2850, 3401, 20, '127.0.0.1', '2021-10-21 01:10:21', 17);
INSERT INTO `sys_record` VALUES (2851, 3601, 20, '127.0.0.1', '2021-10-21 01:10:23', 8);
INSERT INTO `sys_record` VALUES (2852, 3102, 20, '127.0.0.1', '2021-10-21 01:11:16', 16);
INSERT INTO `sys_record` VALUES (2853, 3201, 20, '127.0.0.1', '2021-10-21 01:11:17', 1768);
INSERT INTO `sys_record` VALUES (2854, 3601, 20, '127.0.0.1', '2021-10-21 01:11:23', 49);
INSERT INTO `sys_record` VALUES (2855, 3102, 20, '127.0.0.1', '2021-10-21 01:12:39', 20);
INSERT INTO `sys_record` VALUES (2856, 3601, 20, '127.0.0.1', '2021-10-21 01:12:39', 30);
INSERT INTO `sys_record` VALUES (2857, 3401, 20, '127.0.0.1', '2021-10-21 01:12:57', 17);
INSERT INTO `sys_record` VALUES (2858, 3102, 20, '127.0.0.1', '2021-10-21 01:17:01', 13);
INSERT INTO `sys_record` VALUES (2859, 3401, 20, '127.0.0.1', '2021-10-21 01:17:01', 18);
INSERT INTO `sys_record` VALUES (2860, 3102, 20, '127.0.0.1', '2021-10-21 01:17:04', 5);
INSERT INTO `sys_record` VALUES (2861, 3401, 20, '127.0.0.1', '2021-10-21 01:17:04', 9);
INSERT INTO `sys_record` VALUES (2862, 3102, 20, '127.0.0.1', '2021-10-21 01:17:06', 6);
INSERT INTO `sys_record` VALUES (2863, 3401, 20, '127.0.0.1', '2021-10-21 01:17:06', 6);
INSERT INTO `sys_record` VALUES (2864, 3401, 20, '127.0.0.1', '2021-10-21 01:19:00', 14);
INSERT INTO `sys_record` VALUES (2865, 3102, 20, '127.0.0.1', '2021-10-21 01:19:00', 13);
INSERT INTO `sys_record` VALUES (2866, 3401, 20, '127.0.0.1', '2021-10-21 01:19:04', 5);
INSERT INTO `sys_record` VALUES (2867, 3102, 20, '127.0.0.1', '2021-10-21 01:19:04', 4);
INSERT INTO `sys_record` VALUES (2868, 3102, 20, '127.0.0.1', '2021-10-21 01:19:06', 5);
INSERT INTO `sys_record` VALUES (2869, 3401, 20, '127.0.0.1', '2021-10-21 01:19:06', 8);
INSERT INTO `sys_record` VALUES (2870, 3102, 20, '127.0.0.1', '2021-10-21 01:19:17', 2);
INSERT INTO `sys_record` VALUES (2871, 3401, 20, '127.0.0.1', '2021-10-21 01:19:17', 4);
INSERT INTO `sys_record` VALUES (2872, 3401, 20, '127.0.0.1', '2021-10-21 01:20:10', 59);
INSERT INTO `sys_record` VALUES (2873, 3102, 20, '127.0.0.1', '2021-10-21 01:20:10', 56);
INSERT INTO `sys_record` VALUES (2874, NULL, NULL, '127.0.0.1', '2021-10-23 23:54:49', 3923);
INSERT INTO `sys_record` VALUES (2875, NULL, NULL, '127.0.0.1', '2021-10-23 23:56:32', 21833);
INSERT INTO `sys_record` VALUES (2876, NULL, NULL, '127.0.0.1', '2021-10-23 23:57:01', 23477);
INSERT INTO `sys_record` VALUES (2877, NULL, NULL, '127.0.0.1', '2021-10-23 23:57:30', 4);
INSERT INTO `sys_record` VALUES (2878, 3102, 20, '127.0.0.1', '2021-10-24 00:39:17', 55);
INSERT INTO `sys_record` VALUES (2879, 3201, 20, '127.0.0.1', '2021-10-24 00:39:19', 2121);
INSERT INTO `sys_record` VALUES (2880, 3201, 20, '127.0.0.1', '2021-10-24 00:40:38', 1185);
INSERT INTO `sys_record` VALUES (2881, 3201, 20, '127.0.0.1', '2021-10-24 00:43:58', 1221);
INSERT INTO `sys_record` VALUES (2882, 3201, 20, '127.0.0.1', '2021-10-24 00:47:18', 1253);
INSERT INTO `sys_record` VALUES (2883, 3201, 20, '127.0.0.1', '2021-10-24 00:50:38', 1195);
INSERT INTO `sys_record` VALUES (2884, 3201, 20, '127.0.0.1', '2021-10-24 00:53:58', 1212);
INSERT INTO `sys_record` VALUES (2885, 3201, 20, '127.0.0.1', '2021-10-24 00:57:52', 1200);
INSERT INTO `sys_record` VALUES (2886, 3201, 20, '127.0.0.1', '2021-10-24 01:00:52', 1194);
INSERT INTO `sys_record` VALUES (2887, 3201, 20, '127.0.0.1', '2021-10-24 01:04:52', 1185);
INSERT INTO `sys_record` VALUES (2888, 3201, 20, '127.0.0.1', '2021-10-24 01:07:52', 1193);
INSERT INTO `sys_record` VALUES (2889, 3201, 20, '127.0.0.1', '2021-10-24 01:10:52', 1190);
INSERT INTO `sys_record` VALUES (2890, 3201, 20, '127.0.0.1', '2021-10-24 01:14:52', 1227);
INSERT INTO `sys_record` VALUES (2891, 3201, 20, '127.0.0.1', '2021-10-24 01:17:52', 1196);
INSERT INTO `sys_record` VALUES (2892, 3201, 20, '127.0.0.1', '2021-10-24 01:20:52', 1205);
INSERT INTO `sys_record` VALUES (2893, 3102, 20, '127.0.0.1', '2021-10-24 01:22:31', 8);
INSERT INTO `sys_record` VALUES (2894, 3201, 20, '127.0.0.1', '2021-10-24 01:22:33', 1213);
INSERT INTO `sys_record` VALUES (2895, 3201, 20, '127.0.0.1', '2021-10-24 01:25:53', 1217);
INSERT INTO `sys_record` VALUES (2896, 3102, 20, '127.0.0.1', '2021-10-24 01:25:58', 13);
INSERT INTO `sys_record` VALUES (2897, 3201, 20, '127.0.0.1', '2021-10-24 01:25:59', 1188);
INSERT INTO `sys_record` VALUES (2898, 3102, 20, '127.0.0.1', '2021-10-24 01:26:20', 4);
INSERT INTO `sys_record` VALUES (2899, 3201, 20, '127.0.0.1', '2021-10-24 01:26:21', 1172);
INSERT INTO `sys_record` VALUES (2900, NULL, NULL, '127.0.0.1', '2021-10-24 02:05:53', 11);
INSERT INTO `sys_record` VALUES (2901, 3102, 20, '127.0.0.1', '2021-10-24 02:05:53', 4);
INSERT INTO `sys_record` VALUES (2902, 3201, 20, '127.0.0.1', '2021-10-24 02:06:01', 1227);
INSERT INTO `sys_record` VALUES (2903, 3102, 20, '127.0.0.1', '2021-10-24 02:06:14', 5);
INSERT INTO `sys_record` VALUES (2904, 3201, 20, '127.0.0.1', '2021-10-24 02:06:15', 1197);
INSERT INTO `sys_record` VALUES (2905, NULL, NULL, '127.0.0.1', '2021-10-24 02:07:06', 4);
INSERT INTO `sys_record` VALUES (2906, 3102, 20, '127.0.0.1', '2021-10-24 02:07:06', 5);
INSERT INTO `sys_record` VALUES (2907, 3201, 20, '127.0.0.1', '2021-10-24 02:07:07', 1206);
INSERT INTO `sys_record` VALUES (2908, 3201, 20, '127.0.0.1', '2021-10-24 02:10:28', 1171);
INSERT INTO `sys_record` VALUES (2909, 3201, 20, '127.0.0.1', '2021-10-24 02:13:48', 1161);
INSERT INTO `sys_record` VALUES (2910, 3201, 20, '127.0.0.1', '2021-10-24 02:17:08', 1172);
INSERT INTO `sys_record` VALUES (2911, 3102, 20, '127.0.0.1', '2021-10-24 02:17:18', 4);
INSERT INTO `sys_record` VALUES (2912, 3201, 20, '127.0.0.1', '2021-10-24 02:17:19', 1204);
INSERT INTO `sys_record` VALUES (2913, 3103, 20, '127.0.0.1', '2021-10-24 02:17:21', 81);
INSERT INTO `sys_record` VALUES (2914, 3102, 20, '127.0.0.1', '2021-10-24 02:19:04', 3);
INSERT INTO `sys_record` VALUES (2915, 3103, 20, '127.0.0.1', '2021-10-24 02:19:07', 5);
INSERT INTO `sys_record` VALUES (2916, 3201, 20, '127.0.0.1', '2021-10-24 02:19:07', 1184);
INSERT INTO `sys_record` VALUES (2917, 3102, 20, '127.0.0.1', '2021-10-24 02:22:15', 2);
INSERT INTO `sys_record` VALUES (2918, 3103, 20, '127.0.0.1', '2021-10-24 02:22:15', 6);
INSERT INTO `sys_record` VALUES (2919, 3201, 20, '127.0.0.1', '2021-10-24 02:22:20', 1203);
INSERT INTO `sys_record` VALUES (2920, 3103, 20, '127.0.0.1', '2021-10-24 02:22:21', 6);
INSERT INTO `sys_record` VALUES (2921, 3201, 20, '127.0.0.1', '2021-10-24 02:22:25', 1174);
INSERT INTO `sys_record` VALUES (2922, 3201, 20, '127.0.0.1', '2021-10-24 02:25:46', 1167);
INSERT INTO `sys_record` VALUES (2923, 3201, 20, '127.0.0.1', '2021-10-24 02:29:06', 1227);
INSERT INTO `sys_record` VALUES (2924, 3102, 20, '127.0.0.1', '2021-10-24 02:29:38', 3);
INSERT INTO `sys_record` VALUES (2925, 3201, 20, '127.0.0.1', '2021-10-24 02:29:40', 1196);
INSERT INTO `sys_record` VALUES (2926, 3201, 20, '127.0.0.1', '2021-10-24 02:33:00', 1198);
INSERT INTO `sys_record` VALUES (2927, 3201, 20, '127.0.0.1', '2021-10-24 02:36:20', 1219);
INSERT INTO `sys_record` VALUES (2928, 3201, 20, '127.0.0.1', '2021-10-24 02:39:40', 1137);
INSERT INTO `sys_record` VALUES (2929, 3102, 20, '127.0.0.1', '2021-10-24 13:46:31', 42);
INSERT INTO `sys_record` VALUES (2930, 3201, 20, '127.0.0.1', '2021-10-24 13:46:33', 2198);
INSERT INTO `sys_record` VALUES (2931, 3102, 20, '127.0.0.1', '2021-10-24 14:29:32', 5);
INSERT INTO `sys_record` VALUES (2932, 3103, 20, '127.0.0.1', '2021-10-24 14:29:39', 92);
INSERT INTO `sys_record` VALUES (2933, 3102, 20, '127.0.0.1', '2021-10-24 14:29:52', 6);
INSERT INTO `sys_record` VALUES (2934, 3103, 20, '127.0.0.1', '2021-10-24 14:29:52', 11);
INSERT INTO `sys_record` VALUES (2935, 3102, 20, '127.0.0.1', '2021-10-24 19:57:49', 5);
INSERT INTO `sys_record` VALUES (2936, 3103, 20, '127.0.0.1', '2021-10-24 19:57:49', 25);
INSERT INTO `sys_record` VALUES (2937, 3102, 20, '127.0.0.1', '2021-10-24 19:59:05', 5);
INSERT INTO `sys_record` VALUES (2938, 3102, 20, '127.0.0.1', '2021-10-24 20:08:21', 23);
INSERT INTO `sys_record` VALUES (2939, 3102, 20, '127.0.0.1', '2021-10-25 01:13:19', 5);
INSERT INTO `sys_record` VALUES (2940, 3102, 20, '127.0.0.1', '2021-10-25 01:31:48', 5);
INSERT INTO `sys_record` VALUES (2941, 3103, 20, '127.0.0.1', '2021-10-25 01:31:51', 7);
INSERT INTO `sys_record` VALUES (2942, NULL, NULL, '127.0.0.1', '2021-10-26 01:34:33', 728);
INSERT INTO `sys_record` VALUES (2943, 3701, 20, '127.0.0.1', '2021-10-26 01:35:15', 21);
INSERT INTO `sys_record` VALUES (2944, 3701, 20, '127.0.0.1', '2021-10-26 01:37:47', 17);
INSERT INTO `sys_record` VALUES (2945, 3701, 20, '127.0.0.1', '2021-10-26 01:37:55', 2);
INSERT INTO `sys_record` VALUES (2946, 3701, 20, '127.0.0.1', '2021-10-26 01:38:56', 26448);
INSERT INTO `sys_record` VALUES (2947, 3701, 20, '127.0.0.1', '2021-10-26 01:39:30', 31928);
INSERT INTO `sys_record` VALUES (2948, 3701, 20, '127.0.0.1', '2021-10-26 01:44:06', 16);
INSERT INTO `sys_record` VALUES (2949, 3701, 20, '127.0.0.1', '2021-10-26 01:44:31', 5861);
INSERT INTO `sys_record` VALUES (2950, 3701, 20, '127.0.0.1', '2021-10-26 01:44:58', 18487);
INSERT INTO `sys_record` VALUES (2951, 3701, 20, '127.0.0.1', '2021-10-26 01:45:26', 24934);
INSERT INTO `sys_record` VALUES (2952, 3701, 20, '127.0.0.1', '2021-10-26 01:46:20', 28437);
INSERT INTO `sys_record` VALUES (2953, 3701, 20, '127.0.0.1', '2021-10-26 01:49:35', 2021);
INSERT INTO `sys_record` VALUES (2954, 3701, 20, '127.0.0.1', '2021-10-26 01:52:59', 1552);
INSERT INTO `sys_record` VALUES (2955, 3701, 20, '127.0.0.1', '2021-10-26 01:54:13', 6604);
INSERT INTO `sys_record` VALUES (2956, 3701, 20, '127.0.0.1', '2021-10-26 22:59:37', 41);
INSERT INTO `sys_record` VALUES (2957, 3701, 20, '127.0.0.1', '2021-10-26 23:17:41', 15);
INSERT INTO `sys_record` VALUES (2958, 3701, 20, '127.0.0.1', '2021-10-26 23:49:07', 18);
INSERT INTO `sys_record` VALUES (2959, 3701, 20, '127.0.0.1', '2021-10-26 23:49:22', 2);
INSERT INTO `sys_record` VALUES (2960, 3701, 20, '127.0.0.1', '2021-10-26 23:49:55', 7366);
INSERT INTO `sys_record` VALUES (2961, 3701, 20, '127.0.0.1', '2021-10-26 23:52:46', 2682);
INSERT INTO `sys_record` VALUES (2962, 3701, 20, '127.0.0.1', '2021-10-26 23:56:52', 17);
INSERT INTO `sys_record` VALUES (2963, 3701, 20, '127.0.0.1', '2021-10-26 23:56:53', 2);
INSERT INTO `sys_record` VALUES (2964, 3701, 20, '127.0.0.1', '2021-10-26 23:58:59', 16);
INSERT INTO `sys_record` VALUES (2965, 3701, 20, '127.0.0.1', '2021-10-27 00:04:13', 2169);
INSERT INTO `sys_record` VALUES (2966, 3701, 20, '127.0.0.1', '2021-10-27 00:04:32', 10027);
INSERT INTO `sys_record` VALUES (2967, 3701, 20, '127.0.0.1', '2021-10-27 00:07:18', 19);
INSERT INTO `sys_record` VALUES (2968, 3701, 20, '127.0.0.1', '2021-10-27 00:10:49', 92108);
INSERT INTO `sys_record` VALUES (2969, 3701, 20, '127.0.0.1', '2021-10-27 00:46:10', 17);
INSERT INTO `sys_record` VALUES (2970, 3102, 20, '127.0.0.1', '2021-10-27 00:47:03', 19);
INSERT INTO `sys_record` VALUES (2971, 3201, 20, '127.0.0.1', '2021-10-27 00:47:05', 1985);
INSERT INTO `sys_record` VALUES (2972, 3102, 20, '127.0.0.1', '2021-10-27 00:47:28', 6);
INSERT INTO `sys_record` VALUES (2973, 3201, 20, '127.0.0.1', '2021-10-27 00:47:30', 1217);
INSERT INTO `sys_record` VALUES (2974, 3102, 20, '127.0.0.1', '2021-10-27 00:48:47', 3);
INSERT INTO `sys_record` VALUES (2975, NULL, NULL, '127.0.0.1', '2021-10-27 01:20:47', 17);
INSERT INTO `sys_record` VALUES (2976, 3701, 20, '127.0.0.1', '2021-10-27 01:20:47', 3);
INSERT INTO `sys_record` VALUES (2977, 3102, 20, '127.0.0.1', '2021-10-27 01:20:47', 5);
INSERT INTO `sys_record` VALUES (2978, 3201, 20, '127.0.0.1', '2021-10-27 01:20:48', 1279);
INSERT INTO `sys_record` VALUES (2979, 3701, 20, '127.0.0.1', '2021-10-27 01:22:12', 4);
INSERT INTO `sys_record` VALUES (2980, 3701, 20, '127.0.0.1', '2021-10-27 01:22:18', 2);
INSERT INTO `sys_record` VALUES (2981, 3701, 20, '127.0.0.1', '2021-10-27 01:24:34', 3);
INSERT INTO `sys_record` VALUES (2982, NULL, NULL, '127.0.0.1', '2021-10-27 01:25:22', 6);
INSERT INTO `sys_record` VALUES (2983, NULL, NULL, '127.0.0.1', '2021-10-27 01:26:55', 4);
INSERT INTO `sys_record` VALUES (2984, 3701, 20, '127.0.0.1', '2021-10-27 23:15:45', 126);
INSERT INTO `sys_record` VALUES (2985, NULL, NULL, '127.0.0.1', '2021-10-27 23:35:28', 16);
INSERT INTO `sys_record` VALUES (2986, NULL, NULL, '127.0.0.1', '2021-10-28 00:52:46', 18);
INSERT INTO `sys_record` VALUES (2987, NULL, NULL, '127.0.0.1', '2021-10-28 00:52:46', 33);
INSERT INTO `sys_record` VALUES (2988, NULL, NULL, '127.0.0.1', '2021-10-28 00:58:32', 15);
INSERT INTO `sys_record` VALUES (2989, NULL, NULL, '127.0.0.1', '2021-10-28 00:58:32', 3);
INSERT INTO `sys_record` VALUES (2990, NULL, NULL, '127.0.0.1', '2021-10-28 00:59:09', 6);
INSERT INTO `sys_record` VALUES (2991, NULL, NULL, '127.0.0.1', '2021-10-28 00:59:09', 4);
INSERT INTO `sys_record` VALUES (2992, NULL, NULL, '127.0.0.1', '2021-10-28 00:59:58', 5);
INSERT INTO `sys_record` VALUES (2993, NULL, 20, '127.0.0.1', '2021-10-28 00:59:58', 2);
INSERT INTO `sys_record` VALUES (2994, NULL, 20, '127.0.0.1', '2021-10-28 01:01:59', 4);
INSERT INTO `sys_record` VALUES (2995, NULL, 20, '127.0.0.1', '2021-10-28 01:02:04', 2);
INSERT INTO `sys_record` VALUES (2996, NULL, NULL, '127.0.0.1', '2021-10-28 01:03:10', 5);
INSERT INTO `sys_record` VALUES (2997, NULL, 20, '127.0.0.1', '2021-10-28 01:03:10', 2);
INSERT INTO `sys_record` VALUES (2998, NULL, 20, '127.0.0.1', '2021-10-28 01:10:06', 3);
INSERT INTO `sys_record` VALUES (2999, NULL, 20, '127.0.0.1', '2021-10-28 01:25:01', 2);
INSERT INTO `sys_record` VALUES (3000, NULL, 20, '127.0.0.1', '2021-10-28 01:33:47', 2);
INSERT INTO `sys_record` VALUES (3001, NULL, 20, '127.0.0.1', '2021-10-28 01:36:21', 2);
INSERT INTO `sys_record` VALUES (3002, NULL, 20, '127.0.0.1', '2021-10-28 01:36:23', 3);
INSERT INTO `sys_record` VALUES (3003, NULL, 20, '127.0.0.1', '2021-10-28 01:36:26', 2);
INSERT INTO `sys_record` VALUES (3004, NULL, 20, '127.0.0.1', '2021-10-28 01:37:22', 1);
INSERT INTO `sys_record` VALUES (3005, NULL, 20, '127.0.0.1', '2021-10-28 01:38:32', 2);
INSERT INTO `sys_record` VALUES (3006, NULL, 20, '127.0.0.1', '2021-10-28 01:38:40', 3);
INSERT INTO `sys_record` VALUES (3007, NULL, 20, '127.0.0.1', '2021-10-28 01:38:53', 2);
INSERT INTO `sys_record` VALUES (3008, NULL, 20, '127.0.0.1', '2021-10-28 01:41:08', 2);
INSERT INTO `sys_record` VALUES (3009, NULL, 20, '127.0.0.1', '2021-10-28 01:42:17', 2);
INSERT INTO `sys_record` VALUES (3010, NULL, 20, '127.0.0.1', '2021-10-28 01:43:01', 1);
INSERT INTO `sys_record` VALUES (3011, NULL, 20, '127.0.0.1', '2021-10-28 01:43:30', 1);
INSERT INTO `sys_record` VALUES (3012, NULL, 20, '127.0.0.1', '2021-10-28 01:43:51', 3);
INSERT INTO `sys_record` VALUES (3013, NULL, 20, '127.0.0.1', '2021-10-28 01:44:10', 2);
INSERT INTO `sys_record` VALUES (3014, NULL, 20, '127.0.0.1', '2021-10-28 01:44:59', 1);
INSERT INTO `sys_record` VALUES (3015, NULL, 20, '127.0.0.1', '2021-10-28 01:46:25', 2);
INSERT INTO `sys_record` VALUES (3016, NULL, 20, '127.0.0.1', '2021-10-28 01:46:43', 1);
INSERT INTO `sys_record` VALUES (3017, NULL, 20, '127.0.0.1', '2021-10-28 01:47:12', 1);
INSERT INTO `sys_record` VALUES (3018, NULL, 20, '127.0.0.1', '2021-10-28 01:47:53', 2);
INSERT INTO `sys_record` VALUES (3019, NULL, 20, '127.0.0.1', '2021-10-28 01:48:32', 1);
INSERT INTO `sys_record` VALUES (3020, NULL, 20, '127.0.0.1', '2021-10-28 23:40:21', 128);
INSERT INTO `sys_record` VALUES (3021, NULL, 20, '127.0.0.1', '2021-10-28 23:42:11', 4);
INSERT INTO `sys_record` VALUES (3022, NULL, 20, '127.0.0.1', '2021-10-28 23:42:41', 4);
INSERT INTO `sys_record` VALUES (3023, NULL, 20, '127.0.0.1', '2021-10-28 23:43:34', 4);
INSERT INTO `sys_record` VALUES (3024, NULL, 20, '127.0.0.1', '2021-10-28 23:44:08', 4);
INSERT INTO `sys_record` VALUES (3025, NULL, 20, '127.0.0.1', '2021-10-28 23:44:17', 3);
INSERT INTO `sys_record` VALUES (3026, NULL, 20, '127.0.0.1', '2021-10-28 23:45:26', 2);
INSERT INTO `sys_record` VALUES (3027, NULL, 20, '127.0.0.1', '2021-10-28 23:45:43', 3);
INSERT INTO `sys_record` VALUES (3028, NULL, 20, '127.0.0.1', '2021-10-28 23:47:46', 1);
INSERT INTO `sys_record` VALUES (3029, NULL, 20, '127.0.0.1', '2021-10-28 23:52:41', 2);
INSERT INTO `sys_record` VALUES (3030, NULL, 20, '127.0.0.1', '2021-10-28 23:54:40', 3);
INSERT INTO `sys_record` VALUES (3031, NULL, 20, '127.0.0.1', '2021-10-28 23:55:48', 2);
INSERT INTO `sys_record` VALUES (3032, NULL, 20, '127.0.0.1', '2021-10-28 23:56:15', 2);
INSERT INTO `sys_record` VALUES (3033, NULL, 20, '127.0.0.1', '2021-10-28 23:58:59', 1);
INSERT INTO `sys_record` VALUES (3034, NULL, 20, '127.0.0.1', '2021-10-29 00:00:06', 2);
INSERT INTO `sys_record` VALUES (3035, NULL, 20, '127.0.0.1', '2021-10-29 00:00:15', 2);
INSERT INTO `sys_record` VALUES (3036, NULL, 20, '127.0.0.1', '2021-10-29 00:01:41', 2);
INSERT INTO `sys_record` VALUES (3037, NULL, 20, '127.0.0.1', '2021-10-29 00:02:44', 1);
INSERT INTO `sys_record` VALUES (3038, NULL, 20, '127.0.0.1', '2021-10-29 00:03:23', 2);
INSERT INTO `sys_record` VALUES (3039, NULL, 20, '127.0.0.1', '2021-10-29 00:11:05', 3);
INSERT INTO `sys_record` VALUES (3040, NULL, 20, '127.0.0.1', '2021-10-29 00:11:23', 2);
INSERT INTO `sys_record` VALUES (3041, NULL, 20, '127.0.0.1', '2021-10-29 00:12:27', 2);
INSERT INTO `sys_record` VALUES (3042, NULL, 20, '127.0.0.1', '2021-10-29 00:13:04', 2);
INSERT INTO `sys_record` VALUES (3043, NULL, 20, '127.0.0.1', '2021-10-29 00:13:56', 2);
INSERT INTO `sys_record` VALUES (3044, NULL, 20, '127.0.0.1', '2021-10-29 00:18:55', 2);
INSERT INTO `sys_record` VALUES (3045, NULL, 20, '127.0.0.1', '2021-10-29 00:20:39', 2);
INSERT INTO `sys_record` VALUES (3046, NULL, 20, '127.0.0.1', '2021-10-29 00:23:29', 1);
INSERT INTO `sys_record` VALUES (3047, NULL, 20, '127.0.0.1', '2021-10-29 00:23:50', 2);
INSERT INTO `sys_record` VALUES (3048, NULL, 20, '127.0.0.1', '2021-10-29 00:30:11', 22);
INSERT INTO `sys_record` VALUES (3049, NULL, 20, '127.0.0.1', '2021-10-29 00:30:27', 2);
INSERT INTO `sys_record` VALUES (3050, NULL, 20, '127.0.0.1', '2021-10-29 00:31:32', 2);
INSERT INTO `sys_record` VALUES (3051, NULL, 20, '127.0.0.1', '2021-10-29 00:32:57', 2);
INSERT INTO `sys_record` VALUES (3052, NULL, 20, '127.0.0.1', '2021-10-29 00:33:21', 2);
INSERT INTO `sys_record` VALUES (3053, NULL, 20, '127.0.0.1', '2021-10-29 00:39:04', 2);
INSERT INTO `sys_record` VALUES (3054, NULL, 20, '127.0.0.1', '2021-10-29 00:40:52', 23);
INSERT INTO `sys_record` VALUES (3055, NULL, 20, '127.0.0.1', '2021-10-29 00:41:32', 2);
INSERT INTO `sys_record` VALUES (3056, NULL, NULL, '127.0.0.1', '2021-10-29 00:44:41', 10);
INSERT INTO `sys_record` VALUES (3057, NULL, 20, '127.0.0.1', '2021-10-29 00:44:41', 2);
INSERT INTO `sys_record` VALUES (3058, NULL, 20, '127.0.0.1', '2021-10-29 00:46:12', 2);
INSERT INTO `sys_record` VALUES (3059, NULL, 20, '127.0.0.1', '2021-10-29 00:48:08', 1);
INSERT INTO `sys_record` VALUES (3060, NULL, NULL, '127.0.0.1', '2021-10-29 00:55:55', 5);
INSERT INTO `sys_record` VALUES (3061, NULL, NULL, '127.0.0.1', '2021-10-29 00:59:43', 3);
INSERT INTO `sys_record` VALUES (3062, NULL, NULL, '127.0.0.1', '2021-10-29 01:04:05', 3);
INSERT INTO `sys_record` VALUES (3063, 3102, 20, '127.0.0.1', '2021-10-29 01:04:06', 67);
INSERT INTO `sys_record` VALUES (3064, 3201, 20, '127.0.0.1', '2021-10-29 01:04:08', 2640);
INSERT INTO `sys_record` VALUES (3065, 3401, 20, '127.0.0.1', '2021-10-29 01:04:12', 138);
INSERT INTO `sys_record` VALUES (3066, 3601, 20, '127.0.0.1', '2021-10-29 01:04:13', 13);
INSERT INTO `sys_record` VALUES (3067, NULL, 20, '127.0.0.1', '2021-10-31 22:58:06', 108);
INSERT INTO `sys_record` VALUES (3068, 3102, 20, '127.0.0.1', '2021-11-01 00:31:57', 71);
INSERT INTO `sys_record` VALUES (3069, 3201, 20, '127.0.0.1', '2021-11-01 00:32:00', 2228);
INSERT INTO `sys_record` VALUES (3070, 3102, 20, '127.0.0.1', '2021-11-01 00:32:37', 3);
INSERT INTO `sys_record` VALUES (3071, 3201, 20, '127.0.0.1', '2021-11-01 00:32:41', 1190);
INSERT INTO `sys_record` VALUES (3072, 3102, 20, '127.0.0.1', '2021-11-01 00:33:15', 5);
INSERT INTO `sys_record` VALUES (3073, 3201, 20, '127.0.0.1', '2021-11-01 00:33:18', 1220);
INSERT INTO `sys_record` VALUES (3074, 3102, 20, '127.0.0.1', '2021-11-01 00:33:28', 5);
INSERT INTO `sys_record` VALUES (3075, 3102, 20, '127.0.0.1', '2021-11-01 00:34:41', 4);
INSERT INTO `sys_record` VALUES (3076, 3102, 20, '127.0.0.1', '2021-11-01 00:35:09', 5);
INSERT INTO `sys_record` VALUES (3077, 3103, 20, '127.0.0.1', '2021-11-01 00:35:49', 78);
INSERT INTO `sys_record` VALUES (3078, 3102, 20, '127.0.0.1', '2021-11-01 00:36:00', 5);
INSERT INTO `sys_record` VALUES (3079, 3103, 20, '127.0.0.1', '2021-11-01 00:36:00', 24);
INSERT INTO `sys_record` VALUES (3080, 3103, 20, '127.0.0.1', '2021-11-01 00:36:03', 7);
INSERT INTO `sys_record` VALUES (3081, 3103, 20, '127.0.0.1', '2021-11-01 00:36:05', 6);
INSERT INTO `sys_record` VALUES (3082, 3102, 20, '127.0.0.1', '2021-11-01 00:37:30', 5);
INSERT INTO `sys_record` VALUES (3083, 3103, 20, '127.0.0.1', '2021-11-01 00:37:30', 7);
INSERT INTO `sys_record` VALUES (3084, 3103, 20, '127.0.0.1', '2021-11-01 00:37:47', 5);
INSERT INTO `sys_record` VALUES (3085, NULL, NULL, '127.0.0.1', '2021-11-01 00:38:14', 10);
INSERT INTO `sys_record` VALUES (3086, 3102, 20, '127.0.0.1', '2021-11-01 00:38:14', 3);
INSERT INTO `sys_record` VALUES (3087, 3201, 20, '127.0.0.1', '2021-11-01 00:38:15', 1241);
INSERT INTO `sys_record` VALUES (3088, 3103, 20, '127.0.0.1', '2021-11-01 00:38:19', 5);
INSERT INTO `sys_record` VALUES (3089, 3102, 20, '127.0.0.1', '2021-11-01 00:38:52', 3);
INSERT INTO `sys_record` VALUES (3090, 3103, 20, '127.0.0.1', '2021-11-01 00:38:52', 8);
INSERT INTO `sys_record` VALUES (3091, 3102, 20, '127.0.0.1', '2021-11-01 00:39:00', 3);
INSERT INTO `sys_record` VALUES (3092, 3103, 20, '127.0.0.1', '2021-11-01 00:39:00', 7);
INSERT INTO `sys_record` VALUES (3093, 3102, 20, '127.0.0.1', '2021-11-01 00:40:07', 4);
INSERT INTO `sys_record` VALUES (3094, 3201, 20, '127.0.0.1', '2021-11-01 00:40:09', 1249);
INSERT INTO `sys_record` VALUES (3095, 3102, 20, '127.0.0.1', '2021-11-01 00:40:34', 3);
INSERT INTO `sys_record` VALUES (3096, 3201, 20, '127.0.0.1', '2021-11-01 00:40:35', 1220);
INSERT INTO `sys_record` VALUES (3097, 3103, 20, '127.0.0.1', '2021-11-01 00:40:36', 5);
INSERT INTO `sys_record` VALUES (3098, 3103, 20, '127.0.0.1', '2021-11-01 00:40:38', 4);
INSERT INTO `sys_record` VALUES (3099, 3102, 20, '127.0.0.1', '2021-11-01 00:51:26', 4);
INSERT INTO `sys_record` VALUES (3100, 3103, 20, '127.0.0.1', '2021-11-01 00:51:26', 8);
INSERT INTO `sys_record` VALUES (3101, 3102, 20, '127.0.0.1', '2021-11-01 00:52:39', 4);
INSERT INTO `sys_record` VALUES (3102, 3201, 20, '127.0.0.1', '2021-11-01 00:52:40', 1236);
INSERT INTO `sys_record` VALUES (3103, 3102, 20, '127.0.0.1', '2021-11-01 00:52:46', 3);
INSERT INTO `sys_record` VALUES (3104, 3201, 20, '127.0.0.1', '2021-11-01 00:52:47', 1183);
INSERT INTO `sys_record` VALUES (3105, 3102, 20, '127.0.0.1', '2021-11-01 00:54:25', 3);
INSERT INTO `sys_record` VALUES (3106, 3201, 20, '127.0.0.1', '2021-11-01 00:54:26', 1207);
INSERT INTO `sys_record` VALUES (3107, 3102, 20, '127.0.0.1', '2021-11-01 00:57:57', 3);
INSERT INTO `sys_record` VALUES (3108, 3201, 20, '127.0.0.1', '2021-11-01 00:57:58', 1178);
INSERT INTO `sys_record` VALUES (3109, 3102, 20, '127.0.0.1', '2021-11-01 00:58:43', 4);
INSERT INTO `sys_record` VALUES (3110, 3103, 20, '127.0.0.1', '2021-11-01 00:58:44', 5);
INSERT INTO `sys_record` VALUES (3111, 3103, 20, '127.0.0.1', '2021-11-01 00:58:46', 4);
INSERT INTO `sys_record` VALUES (3112, 3201, 20, '127.0.0.1', '2021-11-01 00:58:50', 1171);
INSERT INTO `sys_record` VALUES (3113, 3103, 20, '127.0.0.1', '2021-11-01 00:58:51', 3);
INSERT INTO `sys_record` VALUES (3114, 3103, 20, '127.0.0.1', '2021-11-01 00:58:55', 5);
INSERT INTO `sys_record` VALUES (3115, 3201, 20, '127.0.0.1', '2021-11-01 01:01:00', 1215);
INSERT INTO `sys_record` VALUES (3116, 3103, 20, '127.0.0.1', '2021-11-01 01:01:00', 4);
INSERT INTO `sys_record` VALUES (3117, 3103, 20, '127.0.0.1', '2021-11-01 01:01:52', 4);
INSERT INTO `sys_record` VALUES (3118, 3102, 20, '127.0.0.1', '2021-11-01 01:03:41', 3);
INSERT INTO `sys_record` VALUES (3119, 3103, 20, '127.0.0.1', '2021-11-01 01:03:42', 5);
INSERT INTO `sys_record` VALUES (3120, 3102, 20, '127.0.0.1', '2021-11-01 01:03:59', 3);
INSERT INTO `sys_record` VALUES (3121, 3103, 20, '127.0.0.1', '2021-11-01 01:03:59', 8);
INSERT INTO `sys_record` VALUES (3122, 3102, 20, '127.0.0.1', '2021-11-01 01:06:30', 3);
INSERT INTO `sys_record` VALUES (3123, 3201, 20, '127.0.0.1', '2021-11-01 01:06:31', 1261);
INSERT INTO `sys_record` VALUES (3124, 3103, 20, '127.0.0.1', '2021-11-01 01:06:31', 4);
INSERT INTO `sys_record` VALUES (3125, 3102, 20, '127.0.0.1', '2021-11-01 01:07:03', 2);
INSERT INTO `sys_record` VALUES (3126, 3103, 20, '127.0.0.1', '2021-11-01 01:07:04', 5);
INSERT INTO `sys_record` VALUES (3127, 3102, 20, '127.0.0.1', '2021-11-01 01:07:33', 3);
INSERT INTO `sys_record` VALUES (3128, 3102, 20, '127.0.0.1', '2021-11-01 01:14:22', 3);
INSERT INTO `sys_record` VALUES (3129, 3201, 20, '127.0.0.1', '2021-11-01 01:14:23', 1250);
INSERT INTO `sys_record` VALUES (3130, 3103, 20, '127.0.0.1', '2021-11-01 01:14:24', 4);
INSERT INTO `sys_record` VALUES (3131, 3102, 20, '127.0.0.1', '2021-11-01 22:08:11', 42);
INSERT INTO `sys_record` VALUES (3132, 3201, 20, '127.0.0.1', '2021-11-01 22:08:13', 2335);
INSERT INTO `sys_record` VALUES (3133, 3201, 20, '127.0.0.1', '2021-11-01 22:11:31', 1175);
INSERT INTO `sys_record` VALUES (3134, 3201, 20, '127.0.0.1', '2021-11-01 22:14:51', 1199);
INSERT INTO `sys_record` VALUES (3135, 3201, 20, '127.0.0.1', '2021-11-01 22:18:11', 1153);
INSERT INTO `sys_record` VALUES (3136, 3201, 20, '127.0.0.1', '2021-11-01 22:21:31', 1217);
INSERT INTO `sys_record` VALUES (3137, 3201, 20, '127.0.0.1', '2021-11-01 22:24:51', 1156);
INSERT INTO `sys_record` VALUES (3138, 3201, 20, '127.0.0.1', '2021-11-01 22:28:11', 1158);
INSERT INTO `sys_record` VALUES (3139, 3201, 20, '127.0.0.1', '2021-11-01 22:31:35', 1175);
INSERT INTO `sys_record` VALUES (3140, 3201, 20, '127.0.0.1', '2021-11-01 22:35:35', 1141);
INSERT INTO `sys_record` VALUES (3141, 3201, 20, '127.0.0.1', '2021-11-01 22:38:39', 1180);
INSERT INTO `sys_record` VALUES (3142, 3201, 20, '127.0.0.1', '2021-11-01 22:41:35', 1200);
INSERT INTO `sys_record` VALUES (3143, 3201, 20, '127.0.0.1', '2021-11-01 22:44:54', 1211);
INSERT INTO `sys_record` VALUES (3144, 3102, 20, '127.0.0.1', '2021-11-01 22:45:05', 8);
INSERT INTO `sys_record` VALUES (3145, 3201, 20, '127.0.0.1', '2021-11-01 22:45:07', 1212);
INSERT INTO `sys_record` VALUES (3146, 3201, 20, '127.0.0.1', '2021-11-01 22:48:26', 1160);
INSERT INTO `sys_record` VALUES (3147, 3103, 20, '127.0.0.1', '2021-11-01 22:49:19', 70);
INSERT INTO `sys_record` VALUES (3148, 3102, 20, '127.0.0.1', '2021-11-01 22:49:25', 4);
INSERT INTO `sys_record` VALUES (3149, 3103, 20, '127.0.0.1', '2021-11-01 22:49:25', 10);
INSERT INTO `sys_record` VALUES (3150, 3102, 20, '127.0.0.1', '2021-11-01 22:50:15', 3);
INSERT INTO `sys_record` VALUES (3151, 3103, 20, '127.0.0.1', '2021-11-01 22:50:15', 8);
INSERT INTO `sys_record` VALUES (3152, 3102, 20, '127.0.0.1', '2021-11-01 22:50:32', 3);
INSERT INTO `sys_record` VALUES (3153, 3103, 20, '127.0.0.1', '2021-11-01 22:50:32', 8);
INSERT INTO `sys_record` VALUES (3154, 3102, 20, '127.0.0.1', '2021-11-01 22:51:13', 4);
INSERT INTO `sys_record` VALUES (3155, 3103, 20, '127.0.0.1', '2021-11-01 22:51:13', 8);
INSERT INTO `sys_record` VALUES (3156, 3102, 20, '127.0.0.1', '2021-11-01 22:51:18', 4);
INSERT INTO `sys_record` VALUES (3157, 3103, 20, '127.0.0.1', '2021-11-01 22:51:18', 8);
INSERT INTO `sys_record` VALUES (3158, 3102, 20, '127.0.0.1', '2021-11-01 22:51:58', 4);
INSERT INTO `sys_record` VALUES (3159, 3201, 20, '127.0.0.1', '2021-11-01 22:51:59', 1211);
INSERT INTO `sys_record` VALUES (3160, 3103, 20, '127.0.0.1', '2021-11-01 22:52:08', 7);
INSERT INTO `sys_record` VALUES (3161, 3102, 20, '127.0.0.1', '2021-11-01 22:52:20', 5);
INSERT INTO `sys_record` VALUES (3162, 3103, 20, '127.0.0.1', '2021-11-01 22:52:20', 8);
INSERT INTO `sys_record` VALUES (3163, 3102, 20, '127.0.0.1', '2021-11-01 22:52:43', 3);
INSERT INTO `sys_record` VALUES (3164, 3102, 20, '127.0.0.1', '2021-11-01 22:56:02', 3);
INSERT INTO `sys_record` VALUES (3165, 3102, 20, '127.0.0.1', '2021-11-01 23:01:13', 3);
INSERT INTO `sys_record` VALUES (3166, 3102, 20, '127.0.0.1', '2021-11-01 23:01:40', 3);
INSERT INTO `sys_record` VALUES (3167, 3102, 20, '127.0.0.1', '2021-11-01 23:06:46', 4);
INSERT INTO `sys_record` VALUES (3168, 3103, 20, '127.0.0.1', '2021-11-01 23:06:48', 5);
INSERT INTO `sys_record` VALUES (3169, 3103, 20, '127.0.0.1', '2021-11-01 23:06:56', 7);
INSERT INTO `sys_record` VALUES (3170, 3102, 20, '127.0.0.1', '2021-11-01 23:06:56', 21);
INSERT INTO `sys_record` VALUES (3171, 3102, 20, '127.0.0.1', '2021-11-01 23:08:39', 3);
INSERT INTO `sys_record` VALUES (3172, 3103, 20, '127.0.0.1', '2021-11-01 23:08:39', 6);
INSERT INTO `sys_record` VALUES (3173, 3102, 20, '127.0.0.1', '2021-11-01 23:08:46', 4);
INSERT INTO `sys_record` VALUES (3174, 3103, 20, '127.0.0.1', '2021-11-01 23:08:46', 7);
INSERT INTO `sys_record` VALUES (3175, 3102, 20, '127.0.0.1', '2021-11-01 23:09:09', 4);
INSERT INTO `sys_record` VALUES (3176, 3201, 20, '127.0.0.1', '2021-11-01 23:09:11', 1303);
INSERT INTO `sys_record` VALUES (3177, 3103, 20, '127.0.0.1', '2021-11-01 23:09:12', 5);
INSERT INTO `sys_record` VALUES (3178, 3102, 20, '127.0.0.1', '2021-11-01 23:13:00', 5);
INSERT INTO `sys_record` VALUES (3179, 3201, 20, '127.0.0.1', '2021-11-01 23:13:02', 1257);
INSERT INTO `sys_record` VALUES (3180, 3103, 20, '127.0.0.1', '2021-11-01 23:13:03', 6);
INSERT INTO `sys_record` VALUES (3181, 3102, 20, '127.0.0.1', '2021-11-01 23:13:12', 2);
INSERT INTO `sys_record` VALUES (3182, 3102, 20, '127.0.0.1', '2021-11-01 23:14:28', 3);
INSERT INTO `sys_record` VALUES (3183, 3201, 20, '127.0.0.1', '2021-11-01 23:15:45', 1189);
INSERT INTO `sys_record` VALUES (3184, 3201, 20, '127.0.0.1', '2021-11-01 23:20:20', 1227);
INSERT INTO `sys_record` VALUES (3185, 3103, 20, '127.0.0.1', '2021-11-01 23:20:23', 5);
INSERT INTO `sys_record` VALUES (3186, 3103, 20, '127.0.0.1', '2021-11-01 23:21:04', 5);
INSERT INTO `sys_record` VALUES (3187, 3102, 20, '127.0.0.1', '2021-11-01 23:21:12', 3);
INSERT INTO `sys_record` VALUES (3188, 3103, 20, '127.0.0.1', '2021-11-01 23:21:12', 7);
INSERT INTO `sys_record` VALUES (3189, 3103, 20, '127.0.0.1', '2021-11-01 23:21:15', 7);
INSERT INTO `sys_record` VALUES (3190, 3201, 20, '127.0.0.1', '2021-11-01 23:21:15', 1204);
INSERT INTO `sys_record` VALUES (3191, 3103, 20, '127.0.0.1', '2021-11-01 23:21:33', 5);
INSERT INTO `sys_record` VALUES (3192, 3201, 20, '127.0.0.1', '2021-11-01 23:21:36', 1171);
INSERT INTO `sys_record` VALUES (3193, 3102, 20, '127.0.0.1', '2021-11-01 23:21:38', 3);
INSERT INTO `sys_record` VALUES (3194, 3201, 20, '127.0.0.1', '2021-11-01 23:21:39', 1177);
INSERT INTO `sys_record` VALUES (3195, 3103, 20, '127.0.0.1', '2021-11-01 23:21:39', 5);
INSERT INTO `sys_record` VALUES (3196, 3102, 20, '127.0.0.1', '2021-11-01 23:22:39', 2);
INSERT INTO `sys_record` VALUES (3197, NULL, NULL, '127.0.0.1', '2021-11-01 23:32:24', 11);
INSERT INTO `sys_record` VALUES (3198, NULL, NULL, '127.0.0.1', '2021-11-01 23:33:51', 3);
INSERT INTO `sys_record` VALUES (3199, NULL, NULL, '127.0.0.1', '2021-11-01 23:35:11', 3);
INSERT INTO `sys_record` VALUES (3200, 3102, 20, '127.0.0.1', '2021-11-01 23:35:11', 2);
INSERT INTO `sys_record` VALUES (3201, 3201, 20, '127.0.0.1', '2021-11-01 23:35:12', 1194);
INSERT INTO `sys_record` VALUES (3202, 3102, 20, '127.0.0.1', '2021-11-01 23:35:21', 1);
INSERT INTO `sys_record` VALUES (3203, 3201, 20, '127.0.0.1', '2021-11-01 23:35:22', 1185);
INSERT INTO `sys_record` VALUES (3204, 3201, 20, '127.0.0.1', '2021-11-01 23:38:43', 1195);
INSERT INTO `sys_record` VALUES (3205, 3201, 20, '127.0.0.1', '2021-11-01 23:42:03', 1208);
INSERT INTO `sys_record` VALUES (3206, 3201, 20, '127.0.0.1', '2021-11-01 23:45:23', 1179);
INSERT INTO `sys_record` VALUES (3207, NULL, NULL, '127.0.0.1', '2021-11-01 23:52:54', 4);
INSERT INTO `sys_record` VALUES (3208, NULL, NULL, '127.0.0.1', '2021-11-01 23:53:39', 4);
INSERT INTO `sys_record` VALUES (3209, NULL, NULL, '127.0.0.1', '2021-11-01 23:57:07', 2);
INSERT INTO `sys_record` VALUES (3210, 3102, 20, '127.0.0.1', '2021-11-01 23:57:07', 3);
INSERT INTO `sys_record` VALUES (3211, 3201, 20, '127.0.0.1', '2021-11-01 23:57:08', 1219);
INSERT INTO `sys_record` VALUES (3212, 3102, 20, '127.0.0.1', '2021-11-01 23:57:44', 2);
INSERT INTO `sys_record` VALUES (3213, 3201, 20, '127.0.0.1', '2021-11-01 23:57:45', 1195);
INSERT INTO `sys_record` VALUES (3214, 3201, 20, '127.0.0.1', '2021-11-02 00:01:06', 1209);
INSERT INTO `sys_record` VALUES (3215, 3102, 20, '127.0.0.1', '2021-11-02 00:01:12', 1);
INSERT INTO `sys_record` VALUES (3216, 3201, 20, '127.0.0.1', '2021-11-02 00:01:13', 1162);
INSERT INTO `sys_record` VALUES (3217, 3201, 20, '127.0.0.1', '2021-11-02 00:04:34', 1152);
INSERT INTO `sys_record` VALUES (3218, 3102, 20, '127.0.0.1', '2021-11-02 00:05:24', 2);
INSERT INTO `sys_record` VALUES (3219, 3201, 20, '127.0.0.1', '2021-11-02 00:05:26', 1215);
INSERT INTO `sys_record` VALUES (3220, 3102, 20, '127.0.0.1', '2021-11-02 00:06:52', 3);
INSERT INTO `sys_record` VALUES (3221, 3201, 20, '127.0.0.1', '2021-11-02 00:06:53', 1188);
INSERT INTO `sys_record` VALUES (3222, 3102, 20, '127.0.0.1', '2021-11-02 00:07:29', 3);
INSERT INTO `sys_record` VALUES (3223, 3201, 20, '127.0.0.1', '2021-11-02 00:07:30', 1183);
INSERT INTO `sys_record` VALUES (3224, 3201, 20, '127.0.0.1', '2021-11-02 00:10:51', 1196);
INSERT INTO `sys_record` VALUES (3225, 3201, 20, '127.0.0.1', '2021-11-02 00:14:11', 1219);
INSERT INTO `sys_record` VALUES (3226, 3201, 20, '127.0.0.1', '2021-11-02 00:17:31', 1249);
INSERT INTO `sys_record` VALUES (3227, 3201, 20, '127.0.0.1', '2021-11-02 00:20:51', 1176);
INSERT INTO `sys_record` VALUES (3228, 3201, 20, '127.0.0.1', '2021-11-02 00:24:39', 1184);
INSERT INTO `sys_record` VALUES (3229, 3201, 20, '127.0.0.1', '2021-11-02 00:27:39', 1179);
INSERT INTO `sys_record` VALUES (3230, 3201, 20, '127.0.0.1', '2021-11-02 00:31:39', 1180);
INSERT INTO `sys_record` VALUES (3231, 3102, 20, '127.0.0.1', '2021-11-02 00:31:45', 3);
INSERT INTO `sys_record` VALUES (3232, 3201, 20, '127.0.0.1', '2021-11-02 00:31:46', 1166);
INSERT INTO `sys_record` VALUES (3233, 3201, 20, '127.0.0.1', '2021-11-02 00:35:06', 1197);
INSERT INTO `sys_record` VALUES (3234, 3102, 20, '127.0.0.1', '2021-11-02 00:35:15', 3);
INSERT INTO `sys_record` VALUES (3235, 3201, 20, '127.0.0.1', '2021-11-02 00:35:16', 1169);
INSERT INTO `sys_record` VALUES (3236, 3102, 20, '127.0.0.1', '2021-11-02 00:36:07', 2);
INSERT INTO `sys_record` VALUES (3237, 3201, 20, '127.0.0.1', '2021-11-02 00:36:08', 1170);
INSERT INTO `sys_record` VALUES (3238, 3102, 20, '127.0.0.1', '2021-11-02 00:38:07', 3);
INSERT INTO `sys_record` VALUES (3239, 3201, 20, '127.0.0.1', '2021-11-02 00:38:08', 1222);
INSERT INTO `sys_record` VALUES (3240, 3102, 20, '127.0.0.1', '2021-11-02 00:38:23', 3);
INSERT INTO `sys_record` VALUES (3241, 3201, 20, '127.0.0.1', '2021-11-02 00:38:24', 1172);
INSERT INTO `sys_record` VALUES (3242, 3102, 20, '127.0.0.1', '2021-11-02 00:38:57', 3);
INSERT INTO `sys_record` VALUES (3243, 3201, 20, '127.0.0.1', '2021-11-02 00:38:59', 1184);
INSERT INTO `sys_record` VALUES (3244, 3102, 20, '127.0.0.1', '2021-11-02 00:40:04', 2);
INSERT INTO `sys_record` VALUES (3245, 3201, 20, '127.0.0.1', '2021-11-02 00:40:05', 1173);
INSERT INTO `sys_record` VALUES (3246, 3102, 20, '127.0.0.1', '2021-11-02 00:40:58', 2);
INSERT INTO `sys_record` VALUES (3247, 3201, 20, '127.0.0.1', '2021-11-02 00:40:59', 1240);
INSERT INTO `sys_record` VALUES (3248, 3102, 20, '127.0.0.1', '2021-11-02 00:44:29', 2);
INSERT INTO `sys_record` VALUES (3249, 3201, 20, '127.0.0.1', '2021-11-02 00:44:31', 1200);
INSERT INTO `sys_record` VALUES (3250, 3102, 20, '127.0.0.1', '2021-11-02 00:45:38', 2);
INSERT INTO `sys_record` VALUES (3251, 3201, 20, '127.0.0.1', '2021-11-02 00:45:40', 1222);
INSERT INTO `sys_record` VALUES (3252, 3201, 20, '127.0.0.1', '2021-11-02 00:49:01', 1162);
INSERT INTO `sys_record` VALUES (3253, NULL, NULL, '127.0.0.1', '2021-11-02 00:50:03', 4);
INSERT INTO `sys_record` VALUES (3254, NULL, NULL, '127.0.0.1', '2021-11-02 00:51:19', 4);
INSERT INTO `sys_record` VALUES (3255, NULL, NULL, '127.0.0.1', '2021-11-02 00:52:13', 2);
INSERT INTO `sys_record` VALUES (3256, 3102, 20, '127.0.0.1', '2021-11-02 00:52:13', 3);
INSERT INTO `sys_record` VALUES (3257, 3201, 20, '127.0.0.1', '2021-11-02 00:52:14', 1197);
INSERT INTO `sys_record` VALUES (3258, 3102, 20, '127.0.0.1', '2021-11-02 00:54:15', 3);
INSERT INTO `sys_record` VALUES (3259, 3201, 20, '127.0.0.1', '2021-11-02 00:54:16', 1268);
INSERT INTO `sys_record` VALUES (3260, NULL, NULL, '127.0.0.1', '2021-11-02 00:54:48', 3);
INSERT INTO `sys_record` VALUES (3261, NULL, NULL, '127.0.0.1', '2021-11-02 00:55:16', 2);
INSERT INTO `sys_record` VALUES (3262, NULL, NULL, '127.0.0.1', '2021-11-02 00:56:04', 4);
INSERT INTO `sys_record` VALUES (3263, NULL, NULL, '127.0.0.1', '2021-11-02 00:56:49', 2);
INSERT INTO `sys_record` VALUES (3264, NULL, NULL, '127.0.0.1', '2021-11-02 00:57:01', 2);
INSERT INTO `sys_record` VALUES (3265, NULL, NULL, '127.0.0.1', '2021-11-02 00:58:00', 2);
INSERT INTO `sys_record` VALUES (3266, 3102, 20, '127.0.0.1', '2021-11-02 00:58:36', 2);
INSERT INTO `sys_record` VALUES (3267, 3201, 20, '127.0.0.1', '2021-11-02 00:58:38', 1181);
INSERT INTO `sys_record` VALUES (3268, NULL, NULL, '127.0.0.1', '2021-11-02 00:59:14', 2);
INSERT INTO `sys_record` VALUES (3269, 3102, 20, '127.0.0.1', '2021-11-02 01:10:22', 3);
INSERT INTO `sys_record` VALUES (3270, 3201, 20, '127.0.0.1', '2021-11-02 01:10:23', 1189);
INSERT INTO `sys_record` VALUES (3271, 3201, 20, '127.0.0.1', '2021-11-02 01:13:44', 1205);
INSERT INTO `sys_record` VALUES (3272, 3201, 20, '127.0.0.1', '2021-11-02 01:17:04', 1177);
INSERT INTO `sys_record` VALUES (3273, 3102, 20, '127.0.0.1', '2021-11-02 01:25:54', 3);
INSERT INTO `sys_record` VALUES (3274, 3201, 20, '127.0.0.1', '2021-11-02 01:25:55', 1221);
INSERT INTO `sys_record` VALUES (3275, 3201, 20, '127.0.0.1', '2021-11-02 01:29:16', 1168);
INSERT INTO `sys_record` VALUES (3276, 3201, 20, '127.0.0.1', '2021-11-02 01:32:36', 1223);
INSERT INTO `sys_record` VALUES (3277, NULL, NULL, '127.0.0.1', '2021-11-02 01:36:37', 3);
INSERT INTO `sys_record` VALUES (3278, NULL, NULL, '127.0.0.1', '2021-11-02 01:38:10', 3);
INSERT INTO `sys_record` VALUES (3279, 3102, 20, '127.0.0.1', '2021-11-02 01:38:10', 3);
INSERT INTO `sys_record` VALUES (3280, 3201, 20, '127.0.0.1', '2021-11-02 01:38:11', 1204);
INSERT INTO `sys_record` VALUES (3281, 3102, 20, '127.0.0.1', '2021-11-02 01:39:42', 2);
INSERT INTO `sys_record` VALUES (3282, 3201, 20, '127.0.0.1', '2021-11-02 01:39:44', 1213);
INSERT INTO `sys_record` VALUES (3283, 3102, 20, '127.0.0.1', '2021-11-02 01:40:11', 2);
INSERT INTO `sys_record` VALUES (3284, 3103, 20, '127.0.0.1', '2021-11-02 01:40:12', 7);
INSERT INTO `sys_record` VALUES (3285, 3102, 20, '127.0.0.1', '2021-11-02 01:40:40', 2);
INSERT INTO `sys_record` VALUES (3286, 3103, 20, '127.0.0.1', '2021-11-02 01:40:40', 4);
INSERT INTO `sys_record` VALUES (3287, 3102, 20, '127.0.0.1', '2021-11-02 01:44:58', 2);
INSERT INTO `sys_record` VALUES (3288, 3103, 20, '127.0.0.1', '2021-11-02 01:44:58', 6);
INSERT INTO `sys_record` VALUES (3289, 3102, 20, '127.0.0.1', '2021-11-02 01:45:05', 4);
INSERT INTO `sys_record` VALUES (3290, 3102, 20, '127.0.0.1', '2021-11-02 01:45:09', 2);
INSERT INTO `sys_record` VALUES (3291, 3102, 20, '127.0.0.1', '2021-11-02 01:46:21', 3);
INSERT INTO `sys_record` VALUES (3292, 3102, 20, '127.0.0.1', '2021-11-02 01:46:36', 2);
INSERT INTO `sys_record` VALUES (3293, 3103, 20, '127.0.0.1', '2021-11-02 01:46:57', 4);
INSERT INTO `sys_record` VALUES (3294, 3103, 20, '127.0.0.1', '2021-11-02 01:47:02', 5);
INSERT INTO `sys_record` VALUES (3295, 3102, 20, '127.0.0.1', '2021-11-02 01:47:02', 1);
INSERT INTO `sys_record` VALUES (3296, 3102, 20, '127.0.0.1', '2021-11-02 01:48:12', 2);
INSERT INTO `sys_record` VALUES (3297, NULL, NULL, '127.0.0.1', '2021-11-02 01:49:53', 2);
INSERT INTO `sys_record` VALUES (3298, NULL, NULL, '127.0.0.1', '2021-11-02 01:50:37', 3);
INSERT INTO `sys_record` VALUES (3299, NULL, NULL, '127.0.0.1', '2021-11-02 01:50:51', 1);
INSERT INTO `sys_record` VALUES (3300, 3102, 20, '127.0.0.1', '2021-11-02 01:50:51', 4);
INSERT INTO `sys_record` VALUES (3301, 3201, 20, '127.0.0.1', '2021-11-02 01:50:52', 1214);
INSERT INTO `sys_record` VALUES (3302, NULL, NULL, '127.0.0.1', '2021-11-02 01:51:50', 4);
INSERT INTO `sys_record` VALUES (3303, NULL, NULL, '127.0.0.1', '2021-11-02 01:52:47', 2);
INSERT INTO `sys_record` VALUES (3304, 3102, 20, '127.0.0.1', '2021-11-02 01:52:47', 2);
INSERT INTO `sys_record` VALUES (3305, 3201, 20, '127.0.0.1', '2021-11-02 01:52:48', 1200);
INSERT INTO `sys_record` VALUES (3306, 3103, 20, '127.0.0.1', '2021-11-02 01:52:51', 2);
INSERT INTO `sys_record` VALUES (3307, 3102, 20, '127.0.0.1', '2021-11-02 01:52:53', 2);
INSERT INTO `sys_record` VALUES (3308, 3103, 20, '127.0.0.1', '2021-11-02 01:52:53', 4);
INSERT INTO `sys_record` VALUES (3309, 3102, 20, '127.0.0.1', '2021-11-02 01:54:05', 3);
INSERT INTO `sys_record` VALUES (3310, 3103, 20, '127.0.0.1', '2021-11-02 01:54:05', 5);
INSERT INTO `sys_record` VALUES (3311, 3102, 20, '127.0.0.1', '2021-11-02 01:54:10', 2);
INSERT INTO `sys_record` VALUES (3312, 3103, 20, '127.0.0.1', '2021-11-02 01:54:10', 4);
INSERT INTO `sys_record` VALUES (3313, 3102, 20, '127.0.0.1', '2021-11-02 01:55:37', 2);
INSERT INTO `sys_record` VALUES (3314, 3103, 20, '127.0.0.1', '2021-11-02 01:55:37', 5);
INSERT INTO `sys_record` VALUES (3315, 3102, 20, '127.0.0.1', '2021-11-02 01:56:05', 3);
INSERT INTO `sys_record` VALUES (3316, 3103, 20, '127.0.0.1', '2021-11-02 01:56:05', 4);
INSERT INTO `sys_record` VALUES (3317, 3102, 20, '127.0.0.1', '2021-11-02 01:57:29', 2);
INSERT INTO `sys_record` VALUES (3318, 3103, 20, '127.0.0.1', '2021-11-02 01:57:29', 4);
INSERT INTO `sys_record` VALUES (3319, 3102, 20, '127.0.0.1', '2021-11-02 01:57:32', 2);
INSERT INTO `sys_record` VALUES (3320, 3103, 20, '127.0.0.1', '2021-11-02 01:57:32', 4);
INSERT INTO `sys_record` VALUES (3321, 3102, 20, '127.0.0.1', '2021-11-02 01:57:35', 2);
INSERT INTO `sys_record` VALUES (3322, 3103, 20, '127.0.0.1', '2021-11-02 01:57:35', 3);
INSERT INTO `sys_record` VALUES (3323, 3102, 20, '127.0.0.1', '2021-11-02 01:58:06', 2);
INSERT INTO `sys_record` VALUES (3324, 3103, 20, '127.0.0.1', '2021-11-02 01:58:06', 6);
INSERT INTO `sys_record` VALUES (3325, 3102, 20, '127.0.0.1', '2021-11-02 01:58:09', 2);
INSERT INTO `sys_record` VALUES (3326, 3103, 20, '127.0.0.1', '2021-11-02 01:58:09', 3);
INSERT INTO `sys_record` VALUES (3327, NULL, NULL, '127.0.0.1', '2021-11-02 01:58:49', 2);
INSERT INTO `sys_record` VALUES (3328, 3102, 20, '127.0.0.1', '2021-11-02 01:58:50', 3);
INSERT INTO `sys_record` VALUES (3329, 3201, 20, '127.0.0.1', '2021-11-02 01:58:51', 1219);
INSERT INTO `sys_record` VALUES (3330, 3102, 20, '127.0.0.1', '2021-11-02 23:32:06', 44);
INSERT INTO `sys_record` VALUES (3331, 3201, 20, '127.0.0.1', '2021-11-02 23:32:08', 2049);
INSERT INTO `sys_record` VALUES (3332, 3102, 20, '127.0.0.1', '2021-11-02 23:32:08', 3);
INSERT INTO `sys_record` VALUES (3333, 3201, 20, '127.0.0.1', '2021-11-02 23:32:16', 1197);
INSERT INTO `sys_record` VALUES (3334, 3102, 20, '127.0.0.1', '2021-11-02 23:33:16', 4);
INSERT INTO `sys_record` VALUES (3335, 3201, 20, '127.0.0.1', '2021-11-02 23:33:18', 1273);
INSERT INTO `sys_record` VALUES (3336, 3102, 20, '127.0.0.1', '2021-11-02 23:33:22', 5);
INSERT INTO `sys_record` VALUES (3337, 3201, 20, '127.0.0.1', '2021-11-02 23:33:23', 1214);
INSERT INTO `sys_record` VALUES (3338, 3102, 20, '127.0.0.1', '2021-11-02 23:33:48', 5);
INSERT INTO `sys_record` VALUES (3339, 3201, 20, '127.0.0.1', '2021-11-02 23:33:49', 1189);
INSERT INTO `sys_record` VALUES (3340, 3102, 20, '127.0.0.1', '2021-11-02 23:33:50', 3);
INSERT INTO `sys_record` VALUES (3341, 3201, 20, '127.0.0.1', '2021-11-02 23:33:52', 1186);
INSERT INTO `sys_record` VALUES (3342, 3102, 20, '127.0.0.1', '2021-11-02 23:34:14', 4);
INSERT INTO `sys_record` VALUES (3343, 3201, 20, '127.0.0.1', '2021-11-02 23:34:15', 1291);
INSERT INTO `sys_record` VALUES (3344, 3102, 20, '127.0.0.1', '2021-11-02 23:34:20', 4);
INSERT INTO `sys_record` VALUES (3345, 3201, 20, '127.0.0.1', '2021-11-02 23:34:22', 1271);
INSERT INTO `sys_record` VALUES (3346, 3102, 20, '127.0.0.1', '2021-11-02 23:36:52', 4);
INSERT INTO `sys_record` VALUES (3347, 3201, 20, '127.0.0.1', '2021-11-02 23:36:53', 1203);
INSERT INTO `sys_record` VALUES (3348, 3102, 20, '127.0.0.1', '2021-11-02 23:37:42', 4);
INSERT INTO `sys_record` VALUES (3349, 3201, 20, '127.0.0.1', '2021-11-02 23:37:44', 1165);
INSERT INTO `sys_record` VALUES (3350, 3201, 20, '127.0.0.1', '2021-11-02 23:41:04', 1223);
INSERT INTO `sys_record` VALUES (3351, NULL, NULL, '127.0.0.1', '2021-11-02 23:47:43', 13);
INSERT INTO `sys_record` VALUES (3352, NULL, NULL, '127.0.0.1', '2021-11-02 23:49:11', 3);
INSERT INTO `sys_record` VALUES (3353, 3102, 20, '127.0.0.1', '2021-11-02 23:49:11', 4);
INSERT INTO `sys_record` VALUES (3354, 3201, 20, '127.0.0.1', '2021-11-02 23:49:13', 1202);
INSERT INTO `sys_record` VALUES (3355, 3102, 20, '127.0.0.1', '2021-11-02 23:49:16', 3);
INSERT INTO `sys_record` VALUES (3356, 3201, 20, '127.0.0.1', '2021-11-02 23:49:17', 1191);
INSERT INTO `sys_record` VALUES (3357, 3201, 20, '127.0.0.1', '2021-11-02 23:52:37', 1215);
INSERT INTO `sys_record` VALUES (3358, 3102, 20, '127.0.0.1', '2021-11-02 23:52:40', 4);
INSERT INTO `sys_record` VALUES (3359, 3201, 20, '127.0.0.1', '2021-11-02 23:52:41', 1226);
INSERT INTO `sys_record` VALUES (3360, 3102, 20, '127.0.0.1', '2021-11-02 23:55:11', 4);
INSERT INTO `sys_record` VALUES (3361, 3201, 20, '127.0.0.1', '2021-11-02 23:55:12', 1194);
INSERT INTO `sys_record` VALUES (3362, 3102, 20, '127.0.0.1', '2021-11-02 23:56:25', 5);
INSERT INTO `sys_record` VALUES (3363, NULL, NULL, '127.0.0.1', '2021-11-02 23:59:41', 6);
INSERT INTO `sys_record` VALUES (3364, 3102, 20, '127.0.0.1', '2021-11-02 23:59:41', 8);
INSERT INTO `sys_record` VALUES (3365, 3201, 20, '127.0.0.1', '2021-11-02 23:59:42', 1198);
INSERT INTO `sys_record` VALUES (3366, 3102, 20, '127.0.0.1', '2021-11-03 00:00:30', 5);
INSERT INTO `sys_record` VALUES (3367, NULL, NULL, '127.0.0.1', '2021-11-03 00:43:14', 12);
INSERT INTO `sys_record` VALUES (3368, NULL, NULL, '127.0.0.1', '2021-11-03 00:44:05', 5);
INSERT INTO `sys_record` VALUES (3369, NULL, NULL, '127.0.0.1', '2021-11-03 00:44:25', 2);
INSERT INTO `sys_record` VALUES (3370, NULL, NULL, '127.0.0.1', '2021-11-03 00:46:22', 17);
INSERT INTO `sys_record` VALUES (3371, 3102, 20, '127.0.0.1', '2021-11-03 00:46:22', 5);
INSERT INTO `sys_record` VALUES (3372, 3201, 20, '127.0.0.1', '2021-11-03 00:46:24', 1230);
INSERT INTO `sys_record` VALUES (3373, NULL, NULL, '127.0.0.1', '2021-11-03 00:53:01', 5);
INSERT INTO `sys_record` VALUES (3374, NULL, NULL, '127.0.0.1', '2021-11-03 00:54:53', 5);
INSERT INTO `sys_record` VALUES (3375, NULL, NULL, '127.0.0.1', '2021-11-03 00:55:38', 2);
INSERT INTO `sys_record` VALUES (3376, 3102, 20, '127.0.0.1', '2021-11-03 00:55:38', 4);
INSERT INTO `sys_record` VALUES (3377, 3201, 20, '127.0.0.1', '2021-11-03 00:55:39', 1216);
INSERT INTO `sys_record` VALUES (3378, 3102, 20, '127.0.0.1', '2021-11-03 00:58:58', 4);
INSERT INTO `sys_record` VALUES (3379, 3201, 20, '127.0.0.1', '2021-11-03 00:58:59', 1189);
INSERT INTO `sys_record` VALUES (3380, 3201, 20, '127.0.0.1', '2021-11-03 01:02:19', 1174);
INSERT INTO `sys_record` VALUES (3381, 3201, 20, '127.0.0.1', '2021-11-03 01:05:39', 1186);
INSERT INTO `sys_record` VALUES (3382, 3201, 20, '127.0.0.1', '2021-11-03 01:08:59', 1192);
INSERT INTO `sys_record` VALUES (3383, NULL, NULL, '127.0.0.1', '2021-11-03 01:10:09', 4);
INSERT INTO `sys_record` VALUES (3384, NULL, NULL, '127.0.0.1', '2021-11-03 01:11:25', 3);
INSERT INTO `sys_record` VALUES (3385, NULL, NULL, '127.0.0.1', '2021-11-03 01:12:14', 4);
INSERT INTO `sys_record` VALUES (3386, NULL, NULL, '127.0.0.1', '2021-11-03 23:36:33', 962);
INSERT INTO `sys_record` VALUES (3387, NULL, NULL, '127.0.0.1', '2021-11-03 23:43:46', 22);
INSERT INTO `sys_record` VALUES (3388, NULL, NULL, '127.0.0.1', '2021-11-04 00:01:28', 6);
INSERT INTO `sys_record` VALUES (3389, NULL, 20, '127.0.0.1', '2021-11-04 00:03:36', 5);
INSERT INTO `sys_record` VALUES (3390, NULL, NULL, '127.0.0.1', '2021-11-04 00:08:23', 5);
INSERT INTO `sys_record` VALUES (3391, 3102, 20, '127.0.0.1', '2021-11-04 00:08:23', 74);
INSERT INTO `sys_record` VALUES (3392, 3201, 20, '127.0.0.1', '2021-11-04 00:08:25', 2127);
INSERT INTO `sys_record` VALUES (3393, NULL, NULL, '127.0.0.1', '2021-11-04 00:08:45', 5);
INSERT INTO `sys_record` VALUES (3394, 3102, 20, '127.0.0.1', '2021-11-04 00:08:46', 6);
INSERT INTO `sys_record` VALUES (3395, 3201, 20, '127.0.0.1', '2021-11-04 00:08:47', 1220);
INSERT INTO `sys_record` VALUES (3396, 3102, 20, '127.0.0.1', '2021-11-04 00:11:43', 26);
INSERT INTO `sys_record` VALUES (3397, 3201, 20, '127.0.0.1', '2021-11-04 00:11:44', 1189);
INSERT INTO `sys_record` VALUES (3398, 3201, 20, '127.0.0.1', '2021-11-04 00:15:04', 1206);
INSERT INTO `sys_record` VALUES (3399, 3201, 20, '127.0.0.1', '2021-11-04 00:18:24', 1237);
INSERT INTO `sys_record` VALUES (3400, NULL, NULL, '127.0.0.1', '2021-11-04 00:42:16', 6);
INSERT INTO `sys_record` VALUES (3401, 3102, 20, '127.0.0.1', '2021-11-04 00:42:16', 9);
INSERT INTO `sys_record` VALUES (3402, 3201, 20, '127.0.0.1', '2021-11-04 00:42:18', 1242);
INSERT INTO `sys_record` VALUES (3403, 3102, 20, '127.0.0.1', '2021-11-04 00:43:19', 3);
INSERT INTO `sys_record` VALUES (3404, 3102, 20, '127.0.0.1', '2021-11-04 00:43:21', 3);
INSERT INTO `sys_record` VALUES (3405, 3102, 20, '127.0.0.1', '2021-11-04 00:44:56', 4);
INSERT INTO `sys_record` VALUES (3406, 3102, 20, '127.0.0.1', '2021-11-04 00:45:39', 4);
INSERT INTO `sys_record` VALUES (3407, 3102, 20, '127.0.0.1', '2021-11-04 00:45:41', 3);
INSERT INTO `sys_record` VALUES (3408, 3102, 20, '127.0.0.1', '2021-11-04 00:46:14', 3);
INSERT INTO `sys_record` VALUES (3409, 3201, 20, '127.0.0.1', '2021-11-04 00:46:16', 1196);
INSERT INTO `sys_record` VALUES (3410, 3103, 20, '127.0.0.1', '2021-11-04 00:46:17', 182);
INSERT INTO `sys_record` VALUES (3411, 3102, 20, '127.0.0.1', '2021-11-04 00:49:06', 6);
INSERT INTO `sys_record` VALUES (3412, 3103, 20, '127.0.0.1', '2021-11-04 00:49:06', 11);
INSERT INTO `sys_record` VALUES (3413, 3102, 20, '127.0.0.1', '2021-11-04 00:50:56', 4);
INSERT INTO `sys_record` VALUES (3414, 3103, 20, '127.0.0.1', '2021-11-04 00:50:56', 7);
INSERT INTO `sys_record` VALUES (3415, 3103, 20, '127.0.0.1', '2021-11-04 00:50:58', 7);
INSERT INTO `sys_record` VALUES (3416, 3201, 20, '127.0.0.1', '2021-11-04 00:51:02', 1178);
INSERT INTO `sys_record` VALUES (3417, 3601, 20, '127.0.0.1', '2021-11-04 00:51:15', 179);
INSERT INTO `sys_record` VALUES (3418, 3401, 20, '127.0.0.1', '2021-11-04 00:51:17', 14);
INSERT INTO `sys_record` VALUES (3419, 3601, 20, '127.0.0.1', '2021-11-04 00:51:18', 8);
INSERT INTO `sys_record` VALUES (3420, 3102, 20, '127.0.0.1', '2021-11-04 00:52:33', 4);
INSERT INTO `sys_record` VALUES (3421, 3201, 20, '127.0.0.1', '2021-11-04 00:52:37', 1201);
INSERT INTO `sys_record` VALUES (3422, 3102, 20, '127.0.0.1', '2021-11-04 00:54:30', 2);
INSERT INTO `sys_record` VALUES (3423, 3201, 20, '127.0.0.1', '2021-11-04 00:54:31', 1215);
INSERT INTO `sys_record` VALUES (3424, 3103, 20, '127.0.0.1', '2021-11-04 00:54:33', 6);
INSERT INTO `sys_record` VALUES (3425, 3201, 20, '127.0.0.1', '2021-11-04 00:54:35', 1176);
INSERT INTO `sys_record` VALUES (3426, 3103, 20, '127.0.0.1', '2021-11-04 00:54:38', 5);
INSERT INTO `sys_record` VALUES (3427, 3103, 20, '127.0.0.1', '2021-11-04 00:54:45', 5);
INSERT INTO `sys_record` VALUES (3428, 3201, 20, '127.0.0.1', '2021-11-04 00:56:11', 1250);
INSERT INTO `sys_record` VALUES (3429, 3201, 20, '127.0.0.1', '2021-11-04 00:56:18', 1162);
INSERT INTO `sys_record` VALUES (3430, 3102, 20, '127.0.0.1', '2021-11-04 00:58:14', 3);
INSERT INTO `sys_record` VALUES (3431, 3102, 20, '127.0.0.1', '2021-11-04 00:58:42', 3);
INSERT INTO `sys_record` VALUES (3432, 3201, 20, '127.0.0.1', '2021-11-04 00:58:45', 1201);
INSERT INTO `sys_record` VALUES (3433, 3102, 20, '127.0.0.1', '2021-11-04 01:03:14', 2);
INSERT INTO `sys_record` VALUES (3434, 3201, 20, '127.0.0.1', '2021-11-04 01:03:16', 1198);
INSERT INTO `sys_record` VALUES (3435, 3103, 20, '127.0.0.1', '2021-11-04 01:03:19', 10);
INSERT INTO `sys_record` VALUES (3436, 3103, 20, '127.0.0.1', '2021-11-04 01:03:21', 5);
INSERT INTO `sys_record` VALUES (3437, 3401, 20, '127.0.0.1', '2021-11-04 01:03:25', 6);
INSERT INTO `sys_record` VALUES (3438, 3601, 20, '127.0.0.1', '2021-11-04 01:03:27', 5);
INSERT INTO `sys_record` VALUES (3439, 3102, 20, '127.0.0.1', '2021-11-04 01:03:37', 1);
INSERT INTO `sys_record` VALUES (3440, 3102, 20, '127.0.0.1', '2021-11-04 01:03:39', 4);
INSERT INTO `sys_record` VALUES (3441, 3201, 20, '127.0.0.1', '2021-11-04 01:03:52', 1167);
INSERT INTO `sys_record` VALUES (3442, NULL, NULL, '127.0.0.1', '2021-11-04 01:03:59', 2);
INSERT INTO `sys_record` VALUES (3443, 3102, 20, '127.0.0.1', '2021-11-04 01:03:59', 2);
INSERT INTO `sys_record` VALUES (3444, 3201, 20, '127.0.0.1', '2021-11-04 01:04:00', 1164);
INSERT INTO `sys_record` VALUES (3445, 3103, 20, '127.0.0.1', '2021-11-04 01:04:02', 3);
INSERT INTO `sys_record` VALUES (3446, 3102, 20, '127.0.0.1', '2021-11-04 01:05:18', 2);
INSERT INTO `sys_record` VALUES (3447, 3103, 20, '127.0.0.1', '2021-11-04 01:05:23', 6);
INSERT INTO `sys_record` VALUES (3448, 3201, 20, '127.0.0.1', '2021-11-04 01:05:23', 1211);
INSERT INTO `sys_record` VALUES (3449, 3201, 20, '127.0.0.1', '2021-11-04 01:05:29', 1180);
INSERT INTO `sys_record` VALUES (3450, 3103, 20, '127.0.0.1', '2021-11-04 01:05:31', 4);
INSERT INTO `sys_record` VALUES (3451, 3102, 20, '127.0.0.1', '2021-11-04 01:36:12', 4);
INSERT INTO `sys_record` VALUES (3452, 3201, 20, '127.0.0.1', '2021-11-04 01:36:13', 1236);
INSERT INTO `sys_record` VALUES (3453, 3103, 20, '127.0.0.1', '2021-11-04 01:36:15', 4);
INSERT INTO `sys_record` VALUES (3454, 3102, 20, '127.0.0.1', '2021-11-04 01:37:37', 3);
INSERT INTO `sys_record` VALUES (3455, 3103, 20, '127.0.0.1', '2021-11-04 01:37:37', 4);
INSERT INTO `sys_record` VALUES (3456, 3102, 20, '127.0.0.1', '2021-11-04 01:37:43', 4);
INSERT INTO `sys_record` VALUES (3457, 3103, 20, '127.0.0.1', '2021-11-04 01:37:43', 5);
INSERT INTO `sys_record` VALUES (3458, 3102, 20, '127.0.0.1', '2021-11-04 01:38:19', 3);
INSERT INTO `sys_record` VALUES (3459, 3103, 20, '127.0.0.1', '2021-11-04 01:38:19', 4);
INSERT INTO `sys_record` VALUES (3460, 3102, 20, '127.0.0.1', '2021-11-04 01:57:01', 16);
INSERT INTO `sys_record` VALUES (3461, 3103, 20, '127.0.0.1', '2021-11-04 01:57:02', 42);
INSERT INTO `sys_record` VALUES (3462, 3102, 20, '127.0.0.1', '2021-11-04 01:59:00', 6);
INSERT INTO `sys_record` VALUES (3463, 3103, 20, '127.0.0.1', '2021-11-04 01:59:00', 12);
INSERT INTO `sys_record` VALUES (3464, 3102, 20, '127.0.0.1', '2021-11-04 02:00:58', 5);
INSERT INTO `sys_record` VALUES (3465, 3103, 20, '127.0.0.1', '2021-11-04 02:00:58', 8);
INSERT INTO `sys_record` VALUES (3466, NULL, 20, '127.0.0.1', '2021-11-04 02:07:03', 18);
INSERT INTO `sys_record` VALUES (3467, NULL, 20, '127.0.0.1', '2021-11-04 02:07:42', 22352);
INSERT INTO `sys_record` VALUES (3468, NULL, 20, '127.0.0.1', '2021-11-04 02:09:16', 16483);
INSERT INTO `sys_record` VALUES (3469, NULL, 20, '127.0.0.1', '2021-11-04 02:10:36', 9287);
INSERT INTO `sys_record` VALUES (3470, NULL, 20, '127.0.0.1', '2021-11-04 02:11:10', 24118);
INSERT INTO `sys_record` VALUES (3471, NULL, 20, '127.0.0.1', '2021-11-04 02:12:50', 4490);
INSERT INTO `sys_record` VALUES (3472, NULL, 20, '127.0.0.1', '2021-11-04 02:13:37', 45677);
INSERT INTO `sys_record` VALUES (3473, NULL, 20, '127.0.0.1', '2021-11-04 02:15:45', 11348);
INSERT INTO `sys_record` VALUES (3474, NULL, 20, '127.0.0.1', '2021-11-05 23:16:41', 5332);
INSERT INTO `sys_record` VALUES (3475, NULL, 20, '127.0.0.1', '2021-11-05 23:18:58', 4613);
INSERT INTO `sys_record` VALUES (3476, NULL, 20, '127.0.0.1', '2021-11-06 01:42:11', 34);
INSERT INTO `sys_record` VALUES (3477, NULL, 20, '127.0.0.1', '2021-11-06 01:44:48', 18);
INSERT INTO `sys_record` VALUES (3478, NULL, 20, '127.0.0.1', '2021-11-06 01:45:43', 18);
INSERT INTO `sys_record` VALUES (3479, NULL, 20, '127.0.0.1', '2021-11-06 15:06:02', 48);
INSERT INTO `sys_record` VALUES (3480, NULL, 20, '127.0.0.1', '2021-11-06 22:32:39', 19);
INSERT INTO `sys_record` VALUES (3481, NULL, NULL, '127.0.0.1', '2021-11-06 22:58:22', 13);
INSERT INTO `sys_record` VALUES (3482, NULL, 20, '127.0.0.1', '2021-11-06 22:58:22', 6);
INSERT INTO `sys_record` VALUES (3483, NULL, 20, '127.0.0.1', '2021-11-06 23:03:55', 4);
INSERT INTO `sys_record` VALUES (3484, NULL, 20, '127.0.0.1', '2021-11-06 23:03:55', 3);
INSERT INTO `sys_record` VALUES (3485, NULL, 20, '127.0.0.1', '2021-11-06 23:04:42', 7);
INSERT INTO `sys_record` VALUES (3486, NULL, 20, '127.0.0.1', '2021-11-06 23:04:42', 6);
INSERT INTO `sys_record` VALUES (3487, NULL, 20, '127.0.0.1', '2021-11-06 23:05:15', 4);
INSERT INTO `sys_record` VALUES (3488, NULL, 20, '127.0.0.1', '2021-11-06 23:05:15', 4);
INSERT INTO `sys_record` VALUES (3489, NULL, NULL, '127.0.0.1', '2021-11-06 23:11:38', 5);
INSERT INTO `sys_record` VALUES (3490, NULL, 20, '127.0.0.1', '2021-11-06 23:11:38', 5);
INSERT INTO `sys_record` VALUES (3491, NULL, NULL, '127.0.0.1', '2021-11-06 23:13:20', 6);
INSERT INTO `sys_record` VALUES (3492, NULL, 20, '127.0.0.1', '2021-11-06 23:13:20', 3);
INSERT INTO `sys_record` VALUES (3493, NULL, NULL, '127.0.0.1', '2021-11-06 23:14:03', 3);
INSERT INTO `sys_record` VALUES (3494, NULL, 20, '127.0.0.1', '2021-11-06 23:14:03', 4);
INSERT INTO `sys_record` VALUES (3495, NULL, 20, '127.0.0.1', '2021-11-06 23:16:46', 3);
INSERT INTO `sys_record` VALUES (3496, NULL, 20, '127.0.0.1', '2021-11-06 23:16:46', 4);
INSERT INTO `sys_record` VALUES (3497, NULL, NULL, '127.0.0.1', '2021-11-06 23:23:09', 6);
INSERT INTO `sys_record` VALUES (3498, NULL, 20, '127.0.0.1', '2021-11-06 23:23:09', 5);
INSERT INTO `sys_record` VALUES (3499, NULL, NULL, '127.0.0.1', '2021-11-06 23:25:34', 4);
INSERT INTO `sys_record` VALUES (3500, NULL, 20, '127.0.0.1', '2021-11-06 23:25:34', 6);
INSERT INTO `sys_record` VALUES (3501, NULL, NULL, '127.0.0.1', '2021-11-06 23:26:59', 5);
INSERT INTO `sys_record` VALUES (3502, NULL, 20, '127.0.0.1', '2021-11-06 23:26:59', 5);
INSERT INTO `sys_record` VALUES (3503, NULL, NULL, '127.0.0.1', '2021-11-06 23:27:25', 3);
INSERT INTO `sys_record` VALUES (3504, NULL, 20, '127.0.0.1', '2021-11-06 23:27:25', 3);
INSERT INTO `sys_record` VALUES (3505, NULL, NULL, '127.0.0.1', '2021-11-06 23:30:06', 7);
INSERT INTO `sys_record` VALUES (3506, NULL, 20, '127.0.0.1', '2021-11-06 23:30:06', 4);
INSERT INTO `sys_record` VALUES (3507, NULL, NULL, '127.0.0.1', '2021-11-06 23:30:42', 5);
INSERT INTO `sys_record` VALUES (3508, NULL, 20, '127.0.0.1', '2021-11-06 23:30:42', 4);
INSERT INTO `sys_record` VALUES (3509, NULL, NULL, '127.0.0.1', '2021-11-06 23:33:22', 4);
INSERT INTO `sys_record` VALUES (3510, NULL, 20, '127.0.0.1', '2021-11-06 23:33:22', 3);
INSERT INTO `sys_record` VALUES (3511, NULL, NULL, '127.0.0.1', '2021-11-06 23:37:09', 6);
INSERT INTO `sys_record` VALUES (3512, NULL, 20, '127.0.0.1', '2021-11-06 23:37:09', 4);
INSERT INTO `sys_record` VALUES (3513, 3102, 20, '127.0.0.1', '2021-11-06 23:37:09', 344);
INSERT INTO `sys_record` VALUES (3514, 3201, 20, '127.0.0.1', '2021-11-06 23:37:11', 2367);
INSERT INTO `sys_record` VALUES (3515, 3103, 20, '127.0.0.1', '2021-11-06 23:37:13', 105);
INSERT INTO `sys_record` VALUES (3516, 3201, 20, '127.0.0.1', '2021-11-06 23:37:15', 1218);
INSERT INTO `sys_record` VALUES (3517, NULL, NULL, '127.0.0.1', '2021-11-06 23:40:44', 6);
INSERT INTO `sys_record` VALUES (3518, NULL, 20, '127.0.0.1', '2021-11-06 23:40:44', 3);
INSERT INTO `sys_record` VALUES (3519, NULL, NULL, '127.0.0.1', '2021-11-06 23:41:41', 3);
INSERT INTO `sys_record` VALUES (3520, NULL, 20, '127.0.0.1', '2021-11-06 23:41:41', 3);
INSERT INTO `sys_record` VALUES (3521, NULL, NULL, '127.0.0.1', '2021-11-06 23:43:23', 3);
INSERT INTO `sys_record` VALUES (3522, NULL, 20, '127.0.0.1', '2021-11-06 23:43:23', 3);
INSERT INTO `sys_record` VALUES (3523, NULL, NULL, '127.0.0.1', '2021-11-06 23:44:42', 4);
INSERT INTO `sys_record` VALUES (3524, NULL, NULL, '127.0.0.1', '2021-11-06 23:53:02', 4);
INSERT INTO `sys_record` VALUES (3525, NULL, NULL, '127.0.0.1', '2021-11-06 23:54:57', 3);
INSERT INTO `sys_record` VALUES (3526, NULL, NULL, '127.0.0.1', '2021-11-06 23:54:57', 3);
INSERT INTO `sys_record` VALUES (3527, NULL, NULL, '127.0.0.1', '2021-11-07 00:01:16', 4);
INSERT INTO `sys_record` VALUES (3528, NULL, 20, '127.0.0.1', '2021-11-07 00:01:16', 2);
INSERT INTO `sys_record` VALUES (3529, NULL, NULL, '127.0.0.1', '2021-11-07 00:03:04', 2);
INSERT INTO `sys_record` VALUES (3530, NULL, 20, '127.0.0.1', '2021-11-07 00:03:26', 3);
INSERT INTO `sys_record` VALUES (3531, NULL, 20, '127.0.0.1', '2021-11-07 00:03:26', 3);
INSERT INTO `sys_record` VALUES (3532, NULL, NULL, '127.0.0.1', '2021-11-07 00:18:40', 5);
INSERT INTO `sys_record` VALUES (3533, NULL, 20, '127.0.0.1', '2021-11-07 00:18:40', 4);
INSERT INTO `sys_record` VALUES (3534, NULL, NULL, '127.0.0.1', '2021-11-07 00:21:51', 4);
INSERT INTO `sys_record` VALUES (3535, NULL, 20, '127.0.0.1', '2021-11-07 00:21:51', 3);
INSERT INTO `sys_record` VALUES (3536, NULL, NULL, '127.0.0.1', '2021-11-07 00:22:20', 3);
INSERT INTO `sys_record` VALUES (3537, NULL, 20, '127.0.0.1', '2021-11-07 00:22:20', 3);
INSERT INTO `sys_record` VALUES (3538, NULL, NULL, '127.0.0.1', '2021-11-07 00:23:16', 3);
INSERT INTO `sys_record` VALUES (3539, NULL, 20, '127.0.0.1', '2021-11-07 00:23:16', 3);
INSERT INTO `sys_record` VALUES (3540, 3102, 20, '127.0.0.1', '2021-11-07 00:25:11', 8);
INSERT INTO `sys_record` VALUES (3541, 3102, 20, '127.0.0.1', '2021-11-07 00:25:12', 4);
INSERT INTO `sys_record` VALUES (3542, 3201, 20, '127.0.0.1', '2021-11-07 00:25:13', 1265);
INSERT INTO `sys_record` VALUES (3543, 3201, 20, '127.0.0.1', '2021-11-07 00:25:14', 1201);
INSERT INTO `sys_record` VALUES (3544, NULL, NULL, '127.0.0.1', '2021-11-07 00:25:27', 3);
INSERT INTO `sys_record` VALUES (3545, NULL, 20, '127.0.0.1', '2021-11-07 00:25:27', 3);
INSERT INTO `sys_record` VALUES (3546, 3102, 20, '127.0.0.1', '2021-11-07 00:25:27', 4);
INSERT INTO `sys_record` VALUES (3547, 3201, 20, '127.0.0.1', '2021-11-07 00:25:28', 1210);
INSERT INTO `sys_record` VALUES (3548, NULL, NULL, '127.0.0.1', '2021-11-07 00:27:51', 5);
INSERT INTO `sys_record` VALUES (3549, NULL, 20, '127.0.0.1', '2021-11-07 00:27:51', 3);
INSERT INTO `sys_record` VALUES (3550, 3102, 20, '127.0.0.1', '2021-11-07 00:27:51', 2);
INSERT INTO `sys_record` VALUES (3551, 3201, 20, '127.0.0.1', '2021-11-07 00:27:53', 1246);
INSERT INTO `sys_record` VALUES (3552, 3201, 20, '127.0.0.1', '2021-11-07 00:27:59', 1193);
INSERT INTO `sys_record` VALUES (3553, 3401, 20, '127.0.0.1', '2021-11-07 00:28:04', 137);
INSERT INTO `sys_record` VALUES (3554, 3601, 20, '127.0.0.1', '2021-11-07 00:28:05', 17);
INSERT INTO `sys_record` VALUES (3555, NULL, NULL, '127.0.0.1', '2021-11-07 00:30:45', 4);
INSERT INTO `sys_record` VALUES (3556, NULL, 20, '127.0.0.1', '2021-11-07 00:30:45', 3);
INSERT INTO `sys_record` VALUES (3557, NULL, NULL, '127.0.0.1', '2021-11-07 00:31:03', 3);
INSERT INTO `sys_record` VALUES (3558, NULL, 20, '127.0.0.1', '2021-11-07 00:31:04', 2);
INSERT INTO `sys_record` VALUES (3559, 3102, 20, '127.0.0.1', '2021-11-07 00:31:04', 4);
INSERT INTO `sys_record` VALUES (3560, 3201, 20, '127.0.0.1', '2021-11-07 00:31:05', 1213);
INSERT INTO `sys_record` VALUES (3561, NULL, NULL, '127.0.0.1', '2021-11-07 00:42:02', 4);
INSERT INTO `sys_record` VALUES (3562, NULL, 20, '127.0.0.1', '2021-11-07 00:42:02', 3);
INSERT INTO `sys_record` VALUES (3563, 3102, 20, '127.0.0.1', '2021-11-07 00:42:02', 3);
INSERT INTO `sys_record` VALUES (3564, 3201, 20, '127.0.0.1', '2021-11-07 00:42:03', 1229);
INSERT INTO `sys_record` VALUES (3565, 3103, 20, '127.0.0.1', '2021-11-07 00:42:06', 5);
INSERT INTO `sys_record` VALUES (3566, 3401, 20, '127.0.0.1', '2021-11-07 00:42:28', 4);
INSERT INTO `sys_record` VALUES (3567, 3601, 20, '127.0.0.1', '2021-11-07 00:42:28', 5);
INSERT INTO `sys_record` VALUES (3568, 3103, 20, '127.0.0.1', '2021-11-07 00:42:38', 6);
INSERT INTO `sys_record` VALUES (3569, 3201, 20, '127.0.0.1', '2021-11-07 00:42:40', 1194);
INSERT INTO `sys_record` VALUES (3570, NULL, NULL, '127.0.0.1', '2021-11-07 00:42:48', 3);
INSERT INTO `sys_record` VALUES (3571, NULL, 20, '127.0.0.1', '2021-11-07 00:42:48', 2);
INSERT INTO `sys_record` VALUES (3572, 3102, 20, '127.0.0.1', '2021-11-07 00:42:49', 2);
INSERT INTO `sys_record` VALUES (3573, 3103, 20, '127.0.0.1', '2021-11-07 00:42:50', 4);
INSERT INTO `sys_record` VALUES (3574, 3201, 20, '127.0.0.1', '2021-11-07 00:42:50', 1243);
INSERT INTO `sys_record` VALUES (3575, NULL, NULL, '127.0.0.1', '2021-11-07 00:43:50', 2);
INSERT INTO `sys_record` VALUES (3576, NULL, 20, '127.0.0.1', '2021-11-07 00:43:50', 2);
INSERT INTO `sys_record` VALUES (3577, 3102, 20, '127.0.0.1', '2021-11-07 00:43:53', 4);
INSERT INTO `sys_record` VALUES (3578, 3201, 20, '127.0.0.1', '2021-11-07 00:43:55', 1263);
INSERT INTO `sys_record` VALUES (3579, NULL, NULL, '127.0.0.1', '2021-11-07 00:44:57', 3);
INSERT INTO `sys_record` VALUES (3580, NULL, 20, '127.0.0.1', '2021-11-07 00:44:57', 2);
INSERT INTO `sys_record` VALUES (3581, 3102, 20, '127.0.0.1', '2021-11-07 00:44:57', 3);
INSERT INTO `sys_record` VALUES (3582, 3201, 20, '127.0.0.1', '2021-11-07 00:44:58', 1201);
INSERT INTO `sys_record` VALUES (3583, 3103, 20, '127.0.0.1', '2021-11-07 00:45:04', 4);
INSERT INTO `sys_record` VALUES (3584, NULL, NULL, '127.0.0.1', '2021-11-07 00:56:39', 3);
INSERT INTO `sys_record` VALUES (3585, NULL, 20, '127.0.0.1', '2021-11-07 00:56:39', 3);
INSERT INTO `sys_record` VALUES (3586, NULL, NULL, '127.0.0.1', '2021-11-07 00:58:19', 2);
INSERT INTO `sys_record` VALUES (3587, NULL, 20, '127.0.0.1', '2021-11-07 00:58:19', 3);
INSERT INTO `sys_record` VALUES (3588, NULL, NULL, '127.0.0.1', '2021-11-07 01:26:07', 3);
INSERT INTO `sys_record` VALUES (3589, NULL, 20, '127.0.0.1', '2021-11-07 01:26:07', 2);
INSERT INTO `sys_record` VALUES (3590, NULL, NULL, '127.0.0.1', '2021-11-07 01:28:45', 4);
INSERT INTO `sys_record` VALUES (3591, NULL, 20, '127.0.0.1', '2021-11-07 01:28:45', 3);
INSERT INTO `sys_record` VALUES (3592, NULL, NULL, '127.0.0.1', '2021-11-07 01:30:53', 5);
INSERT INTO `sys_record` VALUES (3593, NULL, 20, '127.0.0.1', '2021-11-07 01:30:53', 3);
INSERT INTO `sys_record` VALUES (3594, NULL, NULL, '127.0.0.1', '2021-11-07 01:33:06', 4);
INSERT INTO `sys_record` VALUES (3595, NULL, 20, '127.0.0.1', '2021-11-07 01:33:06', 3);
INSERT INTO `sys_record` VALUES (3596, NULL, NULL, '127.0.0.1', '2021-11-07 01:37:53', 4);
INSERT INTO `sys_record` VALUES (3597, NULL, 20, '127.0.0.1', '2021-11-07 01:37:53', 3);
INSERT INTO `sys_record` VALUES (3598, 3102, 20, '127.0.0.1', '2021-11-07 01:37:54', 3);
INSERT INTO `sys_record` VALUES (3599, 3201, 20, '127.0.0.1', '2021-11-07 01:37:55', 1260);
INSERT INTO `sys_record` VALUES (3600, 3102, 20, '127.0.0.1', '2021-11-07 01:38:07', 4);
INSERT INTO `sys_record` VALUES (3601, 3201, 20, '127.0.0.1', '2021-11-07 01:38:08', 1242);
INSERT INTO `sys_record` VALUES (3602, 3201, 20, '127.0.0.1', '2021-11-07 01:41:28', 1185);
INSERT INTO `sys_record` VALUES (3603, 3102, 20, '127.0.0.1', '2021-11-07 01:42:22', 5);
INSERT INTO `sys_record` VALUES (3604, 3201, 20, '127.0.0.1', '2021-11-07 01:42:23', 1212);
INSERT INTO `sys_record` VALUES (3605, 3102, 20, '127.0.0.1', '2021-11-07 01:42:41', 4);
INSERT INTO `sys_record` VALUES (3606, 3201, 20, '127.0.0.1', '2021-11-07 01:42:42', 1204);
INSERT INTO `sys_record` VALUES (3607, 3102, 20, '127.0.0.1', '2021-11-07 01:44:03', 4);
INSERT INTO `sys_record` VALUES (3608, 3201, 20, '127.0.0.1', '2021-11-07 01:44:05', 1220);
INSERT INTO `sys_record` VALUES (3609, 3102, 20, '127.0.0.1', '2021-11-07 01:44:23', 3);
INSERT INTO `sys_record` VALUES (3610, 3201, 20, '127.0.0.1', '2021-11-07 01:44:24', 1186);
INSERT INTO `sys_record` VALUES (3611, 3102, 20, '127.0.0.1', '2021-11-07 01:44:53', 3);
INSERT INTO `sys_record` VALUES (3612, 3201, 20, '127.0.0.1', '2021-11-07 01:44:55', 1189);
INSERT INTO `sys_record` VALUES (3613, 3201, 20, '127.0.0.1', '2021-11-07 02:31:36', 1683);
INSERT INTO `sys_record` VALUES (3614, 3201, 20, '127.0.0.1', '2021-11-07 02:34:55', 1225);
INSERT INTO `sys_record` VALUES (3615, NULL, NULL, '127.0.0.1', '2021-11-07 02:36:55', 16);
INSERT INTO `sys_record` VALUES (3616, 3201, 20, '127.0.0.1', '2021-11-07 02:38:43', 1183);
INSERT INTO `sys_record` VALUES (3617, 3701, 20, '127.0.0.1', '2021-11-07 02:39:12', 3179);
INSERT INTO `sys_record` VALUES (3618, 3102, 20, '127.0.0.1', '2021-11-07 13:58:39', 217);
INSERT INTO `sys_record` VALUES (3619, 3201, 20, '127.0.0.1', '2021-11-07 13:58:42', 3321);
INSERT INTO `sys_record` VALUES (3620, 3201, 20, '127.0.0.1', '2021-11-07 14:02:09', 1196);
INSERT INTO `sys_record` VALUES (3621, 3102, 20, '127.0.0.1', '2021-11-07 16:49:39', 18);
INSERT INTO `sys_record` VALUES (3622, 3201, 20, '127.0.0.1', '2021-11-07 16:49:41', 1260);
INSERT INTO `sys_record` VALUES (3623, NULL, NULL, '127.0.0.1', '2021-11-07 16:50:43', 16);
INSERT INTO `sys_record` VALUES (3624, NULL, NULL, '127.0.0.1', '2021-11-07 16:51:19', 4);
INSERT INTO `sys_record` VALUES (3625, 3701, 20, '127.0.0.1', '2021-11-07 16:51:19', 20);
INSERT INTO `sys_record` VALUES (3626, 3102, 20, '127.0.0.1', '2021-11-07 16:51:19', 4);
INSERT INTO `sys_record` VALUES (3627, 3201, 20, '127.0.0.1', '2021-11-07 16:51:21', 1176);
INSERT INTO `sys_record` VALUES (3628, NULL, NULL, '127.0.0.1', '2021-11-07 16:51:30', 4);
INSERT INTO `sys_record` VALUES (3629, 3701, 22, '127.0.0.1', '2021-11-07 16:51:30', 5);
INSERT INTO `sys_record` VALUES (3630, 3102, 22, '127.0.0.1', '2021-11-07 16:51:30', 6);
INSERT INTO `sys_record` VALUES (3631, 3201, 22, '127.0.0.1', '2021-11-07 16:51:32', 1165);
INSERT INTO `sys_record` VALUES (3632, 3401, 22, '127.0.0.1', '2021-11-07 16:51:37', 163);
INSERT INTO `sys_record` VALUES (3633, 3601, 22, '127.0.0.1', '2021-11-07 16:51:38', 12);
INSERT INTO `sys_record` VALUES (3634, NULL, NULL, '127.0.0.1', '2021-11-07 16:56:09', 26);
INSERT INTO `sys_record` VALUES (3635, 3701, 22, '127.0.0.1', '2021-11-07 16:56:09', 15);
INSERT INTO `sys_record` VALUES (3636, 3102, 22, '127.0.0.1', '2021-11-07 16:56:09', 13);
INSERT INTO `sys_record` VALUES (3637, 3201, 22, '127.0.0.1', '2021-11-07 16:56:10', 1182);
INSERT INTO `sys_record` VALUES (3638, 3103, 22, '127.0.0.1', '2021-11-07 16:56:19', 5);
INSERT INTO `sys_record` VALUES (3639, 3201, 22, '127.0.0.1', '2021-11-07 16:57:23', 1173);
INSERT INTO `sys_record` VALUES (3640, 3201, 22, '127.0.0.1', '2021-11-07 16:57:32', 1161);
INSERT INTO `sys_record` VALUES (3641, 3201, 22, '127.0.0.1', '2021-11-07 17:00:52', 1158);
INSERT INTO `sys_record` VALUES (3642, 3201, 22, '127.0.0.1', '2021-11-07 17:01:03', 1147);
INSERT INTO `sys_record` VALUES (3643, 3102, 22, '127.0.0.1', '2021-11-07 17:02:25', 4);
INSERT INTO `sys_record` VALUES (3644, 3201, 22, '127.0.0.1', '2021-11-07 17:02:26', 1174);
INSERT INTO `sys_record` VALUES (3645, 3201, 22, '127.0.0.1', '2021-11-07 17:05:46', 1143);
INSERT INTO `sys_record` VALUES (3646, 3102, 22, '127.0.0.1', '2021-11-07 17:08:13', 4);
INSERT INTO `sys_record` VALUES (3647, 3201, 22, '127.0.0.1', '2021-11-07 17:08:14', 1163);
INSERT INTO `sys_record` VALUES (3648, 3201, 22, '127.0.0.1', '2021-11-07 17:11:35', 1171);
INSERT INTO `sys_record` VALUES (3649, 3201, 22, '127.0.0.1', '2021-11-07 17:14:55', 1138);
INSERT INTO `sys_record` VALUES (3650, 3201, 22, '127.0.0.1', '2021-11-07 17:18:15', 1132);
INSERT INTO `sys_record` VALUES (3651, 3201, 22, '127.0.0.1', '2021-11-07 17:21:35', 1140);
INSERT INTO `sys_record` VALUES (3652, 3201, 22, '127.0.0.1', '2021-11-07 17:25:02', 1128);
INSERT INTO `sys_record` VALUES (3653, 3201, 22, '127.0.0.1', '2021-11-07 17:29:02', 1141);
INSERT INTO `sys_record` VALUES (3654, 3201, 22, '127.0.0.1', '2021-11-07 17:32:02', 1137);
INSERT INTO `sys_record` VALUES (3655, 3201, 22, '127.0.0.1', '2021-11-07 17:35:02', 1142);
INSERT INTO `sys_record` VALUES (3656, 3201, 22, '127.0.0.1', '2021-11-07 17:39:02', 1148);
INSERT INTO `sys_record` VALUES (3657, 3201, 22, '127.0.0.1', '2021-11-07 17:42:02', 1156);
INSERT INTO `sys_record` VALUES (3658, 3201, 22, '127.0.0.1', '2021-11-07 17:45:02', 1141);
INSERT INTO `sys_record` VALUES (3659, 3201, 22, '127.0.0.1', '2021-11-07 17:49:02', 1150);
INSERT INTO `sys_record` VALUES (3660, 3201, 22, '127.0.0.1', '2021-11-07 17:52:02', 1150);
INSERT INTO `sys_record` VALUES (3661, 3201, 22, '127.0.0.1', '2021-11-07 17:55:02', 1143);
INSERT INTO `sys_record` VALUES (3662, 3201, 22, '127.0.0.1', '2021-11-07 17:59:02', 1166);
INSERT INTO `sys_record` VALUES (3663, 3201, 22, '127.0.0.1', '2021-11-07 18:02:02', 1138);
INSERT INTO `sys_record` VALUES (3664, 3201, 22, '127.0.0.1', '2021-11-07 18:05:02', 1142);
INSERT INTO `sys_record` VALUES (3665, 3201, 22, '127.0.0.1', '2021-11-07 18:09:02', 1137);
INSERT INTO `sys_record` VALUES (3666, 3201, 22, '127.0.0.1', '2021-11-07 18:12:02', 1134);
INSERT INTO `sys_record` VALUES (3667, 3201, 22, '127.0.0.1', '2021-11-07 18:15:02', 1139);
INSERT INTO `sys_record` VALUES (3668, 3201, 22, '127.0.0.1', '2021-11-07 18:19:02', 1147);
INSERT INTO `sys_record` VALUES (3669, 3201, 22, '127.0.0.1', '2021-11-07 18:22:02', 1141);
INSERT INTO `sys_record` VALUES (3670, 3201, 22, '127.0.0.1', '2021-11-07 18:25:02', 1181);
INSERT INTO `sys_record` VALUES (3671, 3201, 22, '127.0.0.1', '2021-11-07 18:29:02', 1146);
INSERT INTO `sys_record` VALUES (3672, 3201, 22, '127.0.0.1', '2021-11-07 18:32:02', 1153);
INSERT INTO `sys_record` VALUES (3673, 3201, 22, '127.0.0.1', '2021-11-07 18:35:02', 1180);
INSERT INTO `sys_record` VALUES (3674, 3201, 22, '127.0.0.1', '2021-11-07 18:39:02', 1137);
INSERT INTO `sys_record` VALUES (3675, 3201, 22, '127.0.0.1', '2021-11-07 18:41:35', 1165);
INSERT INTO `sys_record` VALUES (3676, 3201, 22, '127.0.0.1', '2021-11-07 18:45:02', 1174);
INSERT INTO `sys_record` VALUES (3677, 3201, 22, '127.0.0.1', '2021-11-07 18:49:02', 1165);
INSERT INTO `sys_record` VALUES (3678, 3201, 22, '127.0.0.1', '2021-11-07 18:52:02', 1181);
INSERT INTO `sys_record` VALUES (3679, 3201, 22, '127.0.0.1', '2021-11-07 18:55:02', 1159);
INSERT INTO `sys_record` VALUES (3680, 3201, 22, '127.0.0.1', '2021-11-07 18:59:02', 1172);
INSERT INTO `sys_record` VALUES (3681, 3201, 22, '127.0.0.1', '2021-11-07 19:02:02', 1147);
INSERT INTO `sys_record` VALUES (3682, 3201, 22, '127.0.0.1', '2021-11-07 19:04:55', 1153);
INSERT INTO `sys_record` VALUES (3683, 3201, 22, '127.0.0.1', '2021-11-07 19:09:02', 1192);
INSERT INTO `sys_record` VALUES (3684, 3201, 22, '127.0.0.1', '2021-11-07 19:12:02', 1162);
INSERT INTO `sys_record` VALUES (3685, 3201, 22, '127.0.0.1', '2021-11-07 19:15:02', 1166);
INSERT INTO `sys_record` VALUES (3686, 3201, 22, '127.0.0.1', '2021-11-07 19:19:02', 1187);
INSERT INTO `sys_record` VALUES (3687, 3201, 22, '127.0.0.1', '2021-11-07 19:22:02', 1218);
INSERT INTO `sys_record` VALUES (3688, 3201, 22, '127.0.0.1', '2021-11-07 19:25:02', 1188);
INSERT INTO `sys_record` VALUES (3689, 3201, 22, '127.0.0.1', '2021-11-07 19:29:02', 1206);
INSERT INTO `sys_record` VALUES (3690, 3201, 22, '127.0.0.1', '2021-11-07 19:32:02', 1167);
INSERT INTO `sys_record` VALUES (3691, 3201, 22, '127.0.0.1', '2021-11-07 19:35:02', 1228);
INSERT INTO `sys_record` VALUES (3692, 3201, 22, '127.0.0.1', '2021-11-07 19:39:02', 1185);
INSERT INTO `sys_record` VALUES (3693, 3201, 22, '127.0.0.1', '2021-11-07 19:42:02', 1174);
INSERT INTO `sys_record` VALUES (3694, 3201, 22, '127.0.0.1', '2021-11-07 19:45:02', 1148);
INSERT INTO `sys_record` VALUES (3695, 3201, 22, '127.0.0.1', '2021-11-07 19:49:02', 1174);
INSERT INTO `sys_record` VALUES (3696, 3201, 22, '127.0.0.1', '2021-11-07 19:52:02', 1188);
INSERT INTO `sys_record` VALUES (3697, 3201, 22, '127.0.0.1', '2021-11-07 19:55:02', 1165);
INSERT INTO `sys_record` VALUES (3698, 3201, 22, '127.0.0.1', '2021-11-07 19:59:02', 1151);
INSERT INTO `sys_record` VALUES (3699, 3201, 22, '127.0.0.1', '2021-11-07 20:02:02', 1133);
INSERT INTO `sys_record` VALUES (3700, 3201, 22, '127.0.0.1', '2021-11-07 20:05:02', 1153);
INSERT INTO `sys_record` VALUES (3701, 3201, 22, '127.0.0.1', '2021-11-07 20:09:02', 1160);
INSERT INTO `sys_record` VALUES (3702, 3201, 22, '127.0.0.1', '2021-11-07 20:12:02', 1172);
INSERT INTO `sys_record` VALUES (3703, 3201, 22, '127.0.0.1', '2021-11-07 20:15:02', 1192);
INSERT INTO `sys_record` VALUES (3704, 3201, 22, '127.0.0.1', '2021-11-07 20:19:02', 1149);
INSERT INTO `sys_record` VALUES (3705, 3201, 22, '127.0.0.1', '2021-11-07 20:22:02', 1172);
INSERT INTO `sys_record` VALUES (3706, 3201, 22, '127.0.0.1', '2021-11-07 20:25:02', 1172);
INSERT INTO `sys_record` VALUES (3707, 3201, 22, '127.0.0.1', '2021-11-07 20:29:02', 1156);
INSERT INTO `sys_record` VALUES (3708, 3201, 22, '127.0.0.1', '2021-11-07 20:32:02', 1142);
INSERT INTO `sys_record` VALUES (3709, 3201, 22, '127.0.0.1', '2021-11-07 20:35:02', 1161);
INSERT INTO `sys_record` VALUES (3710, 3201, 22, '127.0.0.1', '2021-11-07 20:39:02', 1198);
INSERT INTO `sys_record` VALUES (3711, 3201, 22, '127.0.0.1', '2021-11-07 20:42:02', 1246);
INSERT INTO `sys_record` VALUES (3712, 3201, 22, '127.0.0.1', '2021-11-07 20:45:02', 1142);
INSERT INTO `sys_record` VALUES (3713, 3201, 22, '127.0.0.1', '2021-11-07 20:49:02', 1159);
INSERT INTO `sys_record` VALUES (3714, 3201, 22, '127.0.0.1', '2021-11-07 20:52:02', 1183);
INSERT INTO `sys_record` VALUES (3715, 3201, 22, '127.0.0.1', '2021-11-07 20:55:02', 1143);
INSERT INTO `sys_record` VALUES (3716, 3201, 22, '127.0.0.1', '2021-11-07 20:59:02', 1148);
INSERT INTO `sys_record` VALUES (3717, 3201, 22, '127.0.0.1', '2021-11-07 21:02:02', 1160);
INSERT INTO `sys_record` VALUES (3718, 3201, 22, '127.0.0.1', '2021-11-07 21:05:02', 1161);
INSERT INTO `sys_record` VALUES (3719, NULL, NULL, '127.0.0.1', '2021-11-08 22:53:28', 830);
INSERT INTO `sys_record` VALUES (3720, NULL, NULL, '127.0.0.1', '2021-11-08 23:55:45', 537);
INSERT INTO `sys_record` VALUES (3721, 3103, 20, '127.0.0.1', '2021-11-08 23:56:27', 79);
INSERT INTO `sys_record` VALUES (3722, 3103, 20, '127.0.0.1', '2021-11-09 00:03:37', 21);
INSERT INTO `sys_record` VALUES (3723, 3103, 20, '127.0.0.1', '2021-11-09 00:06:22', 15);
INSERT INTO `sys_record` VALUES (3724, 3103, 20, '127.0.0.1', '2021-11-09 00:07:09', 6);
INSERT INTO `sys_record` VALUES (3725, 3103, 20, '127.0.0.1', '2021-11-09 00:22:27', 20);
INSERT INTO `sys_record` VALUES (3726, NULL, NULL, '127.0.0.1', '2021-11-09 00:32:25', 197);
INSERT INTO `sys_record` VALUES (3727, NULL, NULL, '127.0.0.1', '2021-11-09 00:33:30', 3);
INSERT INTO `sys_record` VALUES (3728, NULL, NULL, '127.0.0.1', '2021-11-09 00:35:13', 11);
INSERT INTO `sys_record` VALUES (3729, 2504, 20, '127.0.0.1', '2021-11-09 00:40:30', 157);
INSERT INTO `sys_record` VALUES (3730, 3103, 20, '127.0.0.1', '2021-11-09 00:49:07', 13);
INSERT INTO `sys_record` VALUES (3731, 3102, 22, '127.0.0.1', '2021-11-09 01:20:29', 32);
INSERT INTO `sys_record` VALUES (3732, 3201, 22, '127.0.0.1', '2021-11-09 01:20:33', 4118);
INSERT INTO `sys_record` VALUES (3733, 3103, 22, '127.0.0.1', '2021-11-09 01:20:35', 8);
INSERT INTO `sys_record` VALUES (3734, 3201, 22, '127.0.0.1', '2021-11-09 01:20:53', 1254);
INSERT INTO `sys_record` VALUES (3735, 3103, 22, '127.0.0.1', '2021-11-09 01:21:01', 9);
INSERT INTO `sys_record` VALUES (3736, 3103, 22, '127.0.0.1', '2021-11-09 01:21:09', 5);
INSERT INTO `sys_record` VALUES (3737, NULL, NULL, '127.0.0.1', '2021-11-09 01:21:16', 5);
INSERT INTO `sys_record` VALUES (3738, 3701, 20, '127.0.0.1', '2021-11-09 01:21:16', 18);
INSERT INTO `sys_record` VALUES (3739, 3102, 20, '127.0.0.1', '2021-11-09 01:21:16', 4);
INSERT INTO `sys_record` VALUES (3740, 3201, 20, '127.0.0.1', '2021-11-09 01:21:17', 1202);
INSERT INTO `sys_record` VALUES (3741, 3103, 20, '127.0.0.1', '2021-11-09 01:21:26', 7);
INSERT INTO `sys_record` VALUES (3742, 3103, 20, '127.0.0.1', '2021-11-09 01:22:06', 6);
INSERT INTO `sys_record` VALUES (3743, 3201, 20, '127.0.0.1', '2021-11-09 01:22:07', 1191);
INSERT INTO `sys_record` VALUES (3744, 3103, 20, '127.0.0.1', '2021-11-09 01:22:19', 6);
INSERT INTO `sys_record` VALUES (3745, 3201, 20, '127.0.0.1', '2021-11-09 01:22:19', 1205);
INSERT INTO `sys_record` VALUES (3746, 3401, 20, '127.0.0.1', '2021-11-09 01:22:21', 13);
INSERT INTO `sys_record` VALUES (3747, 3601, 20, '127.0.0.1', '2021-11-09 01:22:22', 13);
INSERT INTO `sys_record` VALUES (3748, 3201, 20, '127.0.0.1', '2021-11-09 01:22:32', 1200);
INSERT INTO `sys_record` VALUES (3749, 3103, 20, '127.0.0.1', '2021-11-09 01:22:34', 6);
INSERT INTO `sys_record` VALUES (3750, 3310, 20, '127.0.0.1', '2021-11-09 01:27:54', 7);
INSERT INTO `sys_record` VALUES (3751, 3103, 20, '127.0.0.1', '2021-11-09 01:27:56', 5);
INSERT INTO `sys_record` VALUES (3752, 3103, 20, '127.0.0.1', '2021-11-09 01:28:05', 4);
INSERT INTO `sys_record` VALUES (3753, 3102, 20, '127.0.0.1', '2021-11-09 01:31:08', 4);
INSERT INTO `sys_record` VALUES (3754, 3103, 20, '127.0.0.1', '2021-11-09 01:31:08', 8);
INSERT INTO `sys_record` VALUES (3755, 3103, 20, '127.0.0.1', '2021-11-09 01:33:58', 7);
INSERT INTO `sys_record` VALUES (3756, 3103, 20, '127.0.0.1', '2021-11-09 01:34:00', 5);
INSERT INTO `sys_record` VALUES (3757, 3310, 20, '127.0.0.1', '2021-11-09 01:34:05', 2);
INSERT INTO `sys_record` VALUES (3758, 3103, 20, '127.0.0.1', '2021-11-09 01:34:07', 6);
INSERT INTO `sys_record` VALUES (3759, 3103, 20, '127.0.0.1', '2021-11-09 01:34:46', 4);
INSERT INTO `sys_record` VALUES (3760, 3103, 20, '127.0.0.1', '2021-11-09 01:34:47', 4);
INSERT INTO `sys_record` VALUES (3761, 3103, 20, '127.0.0.1', '2021-11-09 01:34:52', 4);
INSERT INTO `sys_record` VALUES (3762, 3310, 20, '127.0.0.1', '2021-11-09 01:35:16', 2);
INSERT INTO `sys_record` VALUES (3763, 3103, 20, '127.0.0.1', '2021-11-09 01:35:24', 6818);
INSERT INTO `sys_record` VALUES (3764, 3103, 20, '127.0.0.1', '2021-11-09 01:35:33', 4);
INSERT INTO `sys_record` VALUES (3765, 3103, 20, '127.0.0.1', '2021-11-09 01:35:41', 5);
INSERT INTO `sys_record` VALUES (3766, 3103, 20, '127.0.0.1', '2021-11-09 01:35:59', 3);
INSERT INTO `sys_record` VALUES (3767, 3310, 20, '127.0.0.1', '2021-11-09 01:36:02', 5);
INSERT INTO `sys_record` VALUES (3768, 3103, 20, '127.0.0.1', '2021-11-09 01:36:03', 3);
INSERT INTO `sys_record` VALUES (3769, 3103, 20, '127.0.0.1', '2021-11-09 01:36:07', 3);
INSERT INTO `sys_record` VALUES (3770, 3103, 20, '127.0.0.1', '2021-11-09 01:36:09', 4);
INSERT INTO `sys_record` VALUES (3771, 3103, 20, '127.0.0.1', '2021-11-09 01:36:12', 6);
INSERT INTO `sys_record` VALUES (3772, 3102, 20, '127.0.0.1', '2021-11-09 01:36:12', 3);
INSERT INTO `sys_record` VALUES (3773, 3103, 20, '127.0.0.1', '2021-11-09 01:36:13', 3);
INSERT INTO `sys_record` VALUES (3774, 3310, 20, '127.0.0.1', '2021-11-09 01:36:22', 1);
INSERT INTO `sys_record` VALUES (3775, 3103, 20, '127.0.0.1', '2021-11-09 01:36:26', 2940);
INSERT INTO `sys_record` VALUES (3776, 3103, 20, '127.0.0.1', '2021-11-09 01:36:33', 2507);
INSERT INTO `sys_record` VALUES (3777, 3103, 20, '127.0.0.1', '2021-11-09 01:36:36', 1820);
INSERT INTO `sys_record` VALUES (3778, 3103, 20, '127.0.0.1', '2021-11-09 01:36:40', 5);
INSERT INTO `sys_record` VALUES (3779, 3103, 20, '127.0.0.1', '2021-11-09 01:36:43', 5);
INSERT INTO `sys_record` VALUES (3780, 3102, 20, '127.0.0.1', '2021-11-09 01:36:43', 3);
INSERT INTO `sys_record` VALUES (3781, 3103, 20, '127.0.0.1', '2021-11-09 01:40:25', 4);
INSERT INTO `sys_record` VALUES (3782, 3310, 20, '127.0.0.1', '2021-11-09 01:40:28', 5);
INSERT INTO `sys_record` VALUES (3783, 3103, 20, '127.0.0.1', '2021-11-09 01:40:28', 4);
INSERT INTO `sys_record` VALUES (3784, 3103, 20, '127.0.0.1', '2021-11-09 01:40:30', 3);
INSERT INTO `sys_record` VALUES (3785, 3102, 20, '127.0.0.1', '2021-11-09 01:42:08', 16);
INSERT INTO `sys_record` VALUES (3786, 3103, 20, '127.0.0.1', '2021-11-09 01:42:08', 16);
INSERT INTO `sys_record` VALUES (3787, 3103, 20, '127.0.0.1', '2021-11-09 01:42:11', 3);
INSERT INTO `sys_record` VALUES (3788, 3310, 20, '127.0.0.1', '2021-11-09 01:42:14', 4);
INSERT INTO `sys_record` VALUES (3789, 3103, 20, '127.0.0.1', '2021-11-09 01:42:16', 4);
INSERT INTO `sys_record` VALUES (3790, 3103, 20, '127.0.0.1', '2021-11-09 01:42:18', 4);
INSERT INTO `sys_record` VALUES (3791, 3201, 20, '127.0.0.1', '2021-11-09 22:44:42', 1852);
INSERT INTO `sys_record` VALUES (3792, 3201, 20, '127.0.0.1', '2021-11-09 22:48:00', 1222);
INSERT INTO `sys_record` VALUES (3793, 3103, 20, '127.0.0.1', '2021-11-09 22:50:41', 223);
INSERT INTO `sys_record` VALUES (3794, 3102, 20, '127.0.0.1', '2021-11-09 22:50:45', 7);
INSERT INTO `sys_record` VALUES (3795, 3103, 20, '127.0.0.1', '2021-11-09 22:50:45', 15);
INSERT INTO `sys_record` VALUES (3796, 3103, 20, '127.0.0.1', '2021-11-09 22:50:49', 5);
INSERT INTO `sys_record` VALUES (3797, 3401, 20, '127.0.0.1', '2021-11-09 23:37:19', 161);
INSERT INTO `sys_record` VALUES (3798, 3601, 20, '127.0.0.1', '2021-11-09 23:37:20', 17);
INSERT INTO `sys_record` VALUES (3799, 3601, 20, '127.0.0.1', '2021-11-09 23:37:22', 8);
INSERT INTO `sys_record` VALUES (3800, 3601, 20, '127.0.0.1', '2021-11-09 23:37:23', 8);
INSERT INTO `sys_record` VALUES (3801, 3401, 20, '127.0.0.1', '2021-11-09 23:37:24', 6);
INSERT INTO `sys_record` VALUES (3802, 3103, 20, '127.0.0.1', '2021-11-09 23:41:54', 9);
INSERT INTO `sys_record` VALUES (3803, 3201, 20, '127.0.0.1', '2021-11-09 23:42:01', 1191);
INSERT INTO `sys_record` VALUES (3804, 3601, 20, '127.0.0.1', '2021-11-09 23:42:08', 6);
INSERT INTO `sys_record` VALUES (3805, NULL, NULL, '127.0.0.1', '2021-11-28 15:14:50', 48);
INSERT INTO `sys_record` VALUES (3806, NULL, NULL, '127.0.0.1', '2021-11-28 15:14:57', 2);
INSERT INTO `sys_record` VALUES (3807, NULL, NULL, '127.0.0.1', '2021-11-28 15:15:44', 6558);
INSERT INTO `sys_record` VALUES (3808, NULL, NULL, '127.0.0.1', '2021-11-28 15:16:01', 7005);
INSERT INTO `sys_record` VALUES (3809, NULL, NULL, '127.0.0.1', '2021-11-28 15:16:58', 41008);
INSERT INTO `sys_record` VALUES (3810, NULL, NULL, '127.0.0.1', '2021-11-28 15:47:42', 20262);
INSERT INTO `sys_record` VALUES (3811, 1464833849028059157, 20, '127.0.0.1', '2021-11-28 15:54:57', 8);
INSERT INTO `sys_record` VALUES (3812, 1464833849028059157, 20, '127.0.0.1', '2021-11-28 15:56:36', 4);
INSERT INTO `sys_record` VALUES (3813, 1464833849028059157, 20, '127.0.0.1', '2021-11-28 16:03:34', 37);
INSERT INTO `sys_record` VALUES (3814, 1464833849028059157, 20, '127.0.0.1', '2021-11-28 16:30:03', 5);
INSERT INTO `sys_record` VALUES (3815, 1464833849028059157, 20, '127.0.0.1', '2021-11-28 16:32:34', 2);
INSERT INTO `sys_record` VALUES (3816, 1464898273436876810, 20, '127.0.0.1', '2021-11-28 18:06:01', 16);
INSERT INTO `sys_record` VALUES (3817, 1464898840645189637, 20, '127.0.0.1', '2021-11-28 18:08:31', 17);
INSERT INTO `sys_record` VALUES (3818, 1464898840645189637, 20, '127.0.0.1', '2021-11-28 18:09:38', 26);
INSERT INTO `sys_record` VALUES (3819, NULL, NULL, '127.0.0.1', '2021-11-28 18:13:57', 5);
INSERT INTO `sys_record` VALUES (3820, NULL, NULL, '127.0.0.1', '2021-11-28 18:14:34', 0);
INSERT INTO `sys_record` VALUES (3821, NULL, NULL, '127.0.0.1', '2021-11-28 18:18:39', 0);
INSERT INTO `sys_record` VALUES (3822, NULL, NULL, '127.0.0.1', '2021-11-28 18:25:04', 16);
INSERT INTO `sys_record` VALUES (3823, NULL, NULL, '127.0.0.1', '2021-11-28 18:26:05', 0);
INSERT INTO `sys_record` VALUES (3824, NULL, NULL, '127.0.0.1', '2021-11-28 18:27:54', 5);
INSERT INTO `sys_record` VALUES (3825, NULL, NULL, '127.0.0.1', '2021-11-28 22:52:22', 3);
INSERT INTO `sys_record` VALUES (3826, 1464967854650146820, 20, '127.0.0.1', '2021-11-28 22:52:28', 20);
INSERT INTO `sys_record` VALUES (3827, NULL, NULL, '127.0.0.1', '2021-11-30 01:16:01', 841);
INSERT INTO `sys_record` VALUES (3828, NULL, NULL, '127.0.0.1', '2021-11-30 01:16:05', 4);
INSERT INTO `sys_record` VALUES (3829, 1465367418343370757, 20, '127.0.0.1', '2021-11-30 01:16:05', 19);
INSERT INTO `sys_record` VALUES (3830, NULL, 20, '127.0.0.1', '2021-11-30 01:18:34', 4);
INSERT INTO `sys_record` VALUES (3831, 1465367418343370757, 20, '127.0.0.1', '2021-11-30 01:18:34', 8);
INSERT INTO `sys_record` VALUES (3832, 1465367418368536579, 20, '127.0.0.1', '2021-11-30 01:18:56', 125);
INSERT INTO `sys_record` VALUES (3833, 1465367418343370758, 20, '127.0.0.1', '2021-11-30 01:18:58', 2179);
INSERT INTO `sys_record` VALUES (3834, 1465367418368536580, 20, '127.0.0.1', '2021-11-30 01:19:08', 111);
INSERT INTO `sys_record` VALUES (3835, 1465367418343370758, 20, '127.0.0.1', '2021-11-30 01:19:13', 1196);
INSERT INTO `sys_record` VALUES (3836, 1465367418368536580, 20, '127.0.0.1', '2021-11-30 01:19:15', 5);
INSERT INTO `sys_record` VALUES (3837, 1465367418334982148, 20, '127.0.0.1', '2021-11-30 01:19:20', 17);
INSERT INTO `sys_record` VALUES (3838, 1465367418343370754, 20, '127.0.0.1', '2021-11-30 01:19:21', 16);
INSERT INTO `sys_record` VALUES (3839, 1465367418334982148, 20, '127.0.0.1', '2021-11-30 01:19:24', 6);
INSERT INTO `sys_record` VALUES (3840, 1465367418368536580, 20, '127.0.0.1', '2021-11-30 01:22:32', 7);
INSERT INTO `sys_record` VALUES (3841, NULL, NULL, '127.0.0.1', '2021-12-03 01:18:31', 791);
INSERT INTO `sys_record` VALUES (3842, 1466455467181006853, 20, '127.0.0.1', '2021-12-03 01:18:37', 5938);
INSERT INTO `sys_record` VALUES (3843, 1466455467206172678, 20, '127.0.0.1', '2021-12-03 01:18:37', 43);
INSERT INTO `sys_record` VALUES (3844, 1466455467181006854, 20, '127.0.0.1', '2021-12-03 01:18:39', 2142);
INSERT INTO `sys_record` VALUES (3845, 1466455467206172680, 20, '127.0.0.1', '2021-12-03 01:21:41', 165);
INSERT INTO `sys_record` VALUES (3846, NULL, NULL, '127.0.0.1', '2021-12-03 01:23:08', 3);
INSERT INTO `sys_record` VALUES (3847, 1466455467181006853, 20, '127.0.0.1', '2021-12-03 01:23:08', 4);
INSERT INTO `sys_record` VALUES (3848, 1466455467206172678, 20, '127.0.0.1', '2021-12-03 01:23:08', 4);
INSERT INTO `sys_record` VALUES (3849, 1466455467181006854, 20, '127.0.0.1', '2021-12-03 01:23:09', 1214);
INSERT INTO `sys_record` VALUES (3850, 1466455467181006854, 20, '127.0.0.1', '2021-12-03 01:23:18', 1186);
INSERT INTO `sys_record` VALUES (3851, 1466455467181006854, 20, '127.0.0.1', '2021-12-03 01:23:25', 1164);
INSERT INTO `sys_record` VALUES (3852, 1466455467206172680, 20, '127.0.0.1', '2021-12-03 01:26:41', 7);
INSERT INTO `sys_record` VALUES (3853, 1466807385535926275, 20, '127.0.0.1', '2021-12-04 00:34:42', 1917);
INSERT INTO `sys_record` VALUES (3854, 1466807385569480710, 20, '127.0.0.1', '2021-12-04 00:35:57', 54);
INSERT INTO `sys_record` VALUES (3855, 1466807385535926275, 20, '127.0.0.1', '2021-12-04 00:35:58', 1231);
INSERT INTO `sys_record` VALUES (3856, 1466807385569480708, 20, '127.0.0.1', '2021-12-04 00:36:04', 54);
INSERT INTO `sys_record` VALUES (3857, 1466807385569480708, 20, '127.0.0.1', '2021-12-04 00:37:13', 4);
INSERT INTO `sys_record` VALUES (3858, 1466807385569480708, 20, '127.0.0.1', '2021-12-04 00:54:54', 8);
INSERT INTO `sys_record` VALUES (3859, 1466807385569480710, 20, '127.0.0.1', '2021-12-04 00:54:54', 5);
INSERT INTO `sys_record` VALUES (3860, 1466807385569480710, 20, '127.0.0.1', '2021-12-04 01:03:13', 3);
INSERT INTO `sys_record` VALUES (3861, 1466807385569480708, 20, '127.0.0.1', '2021-12-04 01:03:13', 7);
INSERT INTO `sys_record` VALUES (3862, 1466807385569480710, 20, '127.0.0.1', '2021-12-04 01:44:22', 3);
INSERT INTO `sys_record` VALUES (3863, 1466807385569480708, 20, '127.0.0.1', '2021-12-04 01:44:22', 6);
INSERT INTO `sys_record` VALUES (3864, 1467163685985275906, 20, '127.0.0.1', '2021-12-05 00:15:05', 126);
INSERT INTO `sys_record` VALUES (3865, 1467165909616513031, 20, '127.0.0.1', '2021-12-05 00:16:52', 14);
INSERT INTO `sys_record` VALUES (3866, 1467169482031058965, 20, '127.0.0.1', '2021-12-05 00:31:13', 65);
INSERT INTO `sys_record` VALUES (3867, 1467169482031058965, 20, '127.0.0.1', '2021-12-05 00:31:34', 6);
INSERT INTO `sys_record` VALUES (3868, 1467169482031058965, 20, '127.0.0.1', '2021-12-05 00:31:58', 9);
INSERT INTO `sys_record` VALUES (3869, 1467169482031058965, 20, '127.0.0.1', '2021-12-05 00:32:12', 2);
INSERT INTO `sys_record` VALUES (3870, 1467169482031058965, 20, '127.0.0.1', '2021-12-05 00:32:28', 5);
INSERT INTO `sys_record` VALUES (3871, 1467170208153161731, 20, '127.0.0.1', '2021-12-05 00:54:50', 12);
INSERT INTO `sys_record` VALUES (3872, 1467175795163222017, 20, '127.0.0.1', '2021-12-05 00:57:21', 14);
INSERT INTO `sys_record` VALUES (3873, 1467175795154833437, 20, '127.0.0.1', '2021-12-05 00:57:58', 4);
INSERT INTO `sys_record` VALUES (3874, 1467175795154833420, 20, '127.0.0.1', '2021-12-05 00:58:00', 2001);
INSERT INTO `sys_record` VALUES (3875, 1467175795163222017, 20, '127.0.0.1', '2021-12-05 00:58:05', 5);
INSERT INTO `sys_record` VALUES (3876, NULL, 20, '127.0.0.1', '2021-12-05 01:38:35', 6862);
INSERT INTO `sys_record` VALUES (3877, NULL, 20, '127.0.0.1', '2021-12-05 01:39:56', 18312);
INSERT INTO `sys_record` VALUES (3878, NULL, 20, '127.0.0.1', '2021-12-05 01:42:48', 11);
INSERT INTO `sys_record` VALUES (3879, 1467187594289827849, 20, '127.0.0.1', '2021-12-05 01:45:39', 10);
INSERT INTO `sys_record` VALUES (3880, 1467187594289827850, 20, '127.0.0.1', '2021-12-05 01:45:39', 13);
INSERT INTO `sys_record` VALUES (3881, 1467187594289827849, 20, '127.0.0.1', '2021-12-05 01:48:53', 3);
INSERT INTO `sys_record` VALUES (3882, 1467187594289827850, 20, '127.0.0.1', '2021-12-05 01:48:53', 6);
INSERT INTO `sys_record` VALUES (3883, NULL, NULL, '127.0.0.1', '2021-12-05 01:50:28', 2);
INSERT INTO `sys_record` VALUES (3884, 1467187594281439251, 20, '127.0.0.1', '2021-12-05 01:50:28', 14);
INSERT INTO `sys_record` VALUES (3885, 1467187594289827849, 20, '127.0.0.1', '2021-12-05 01:50:28', 2);
INSERT INTO `sys_record` VALUES (3886, 1467187594281439252, 20, '127.0.0.1', '2021-12-05 01:50:29', 1267);
INSERT INTO `sys_record` VALUES (3887, 1467187594289827850, 20, '127.0.0.1', '2021-12-05 01:50:32', 4);
INSERT INTO `sys_record` VALUES (3888, 1467187594289827849, 20, '127.0.0.1', '2021-12-05 01:51:16', 4);
INSERT INTO `sys_record` VALUES (3889, 1467187594289827850, 20, '127.0.0.1', '2021-12-05 01:51:16', 7);
INSERT INTO `sys_record` VALUES (3890, 1467187594289827849, 20, '127.0.0.1', '2021-12-05 01:51:45', 3);
INSERT INTO `sys_record` VALUES (3891, 1467187594289827850, 20, '127.0.0.1', '2021-12-05 01:51:45', 7);
INSERT INTO `sys_record` VALUES (3892, NULL, NULL, '127.0.0.1', '2021-12-05 02:05:24', 14);
INSERT INTO `sys_record` VALUES (3893, 1467192743641042946, 20, '127.0.0.1', '2021-12-05 02:05:24', 17);
INSERT INTO `sys_record` VALUES (3894, 1467192743657820163, 20, '127.0.0.1', '2021-12-05 02:05:25', 13);
INSERT INTO `sys_record` VALUES (3895, 1467192743641042947, 20, '127.0.0.1', '2021-12-05 02:05:26', 1196);
INSERT INTO `sys_record` VALUES (3896, NULL, 20, '127.0.0.1', '2021-12-05 02:06:54', 7);
INSERT INTO `sys_record` VALUES (3897, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:06:59', 9);
INSERT INTO `sys_record` VALUES (3898, 1467193546749595658, 20, '127.0.0.1', '2021-12-05 02:07:00', 1168);
INSERT INTO `sys_record` VALUES (3899, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:07:07', 7);
INSERT INTO `sys_record` VALUES (3900, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:07:47', 1);
INSERT INTO `sys_record` VALUES (3901, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:07:47', 6);
INSERT INTO `sys_record` VALUES (3902, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:14:06', 2);
INSERT INTO `sys_record` VALUES (3903, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:14:06', 8);
INSERT INTO `sys_record` VALUES (3904, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:14:28', 2);
INSERT INTO `sys_record` VALUES (3905, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:14:28', 7);
INSERT INTO `sys_record` VALUES (3906, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:14:34', 1);
INSERT INTO `sys_record` VALUES (3907, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:14:34', 6);
INSERT INTO `sys_record` VALUES (3908, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:14:40', 2);
INSERT INTO `sys_record` VALUES (3909, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:14:40', 6);
INSERT INTO `sys_record` VALUES (3910, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:14:44', 1);
INSERT INTO `sys_record` VALUES (3911, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:14:44', 6);
INSERT INTO `sys_record` VALUES (3912, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:15:04', 1);
INSERT INTO `sys_record` VALUES (3913, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:15:04', 9);
INSERT INTO `sys_record` VALUES (3914, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:15:11', 2);
INSERT INTO `sys_record` VALUES (3915, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:15:11', 6);
INSERT INTO `sys_record` VALUES (3916, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:15:19', 2);
INSERT INTO `sys_record` VALUES (3917, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:15:19', 7);
INSERT INTO `sys_record` VALUES (3918, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:15:30', 1);
INSERT INTO `sys_record` VALUES (3919, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:15:30', 5);
INSERT INTO `sys_record` VALUES (3920, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:15:48', 2);
INSERT INTO `sys_record` VALUES (3921, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:15:48', 6);
INSERT INTO `sys_record` VALUES (3922, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:16:31', 2);
INSERT INTO `sys_record` VALUES (3923, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:16:31', 6);
INSERT INTO `sys_record` VALUES (3924, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:17:10', 2);
INSERT INTO `sys_record` VALUES (3925, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:17:10', 7);
INSERT INTO `sys_record` VALUES (3926, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:18:26', 2);
INSERT INTO `sys_record` VALUES (3927, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:18:26', 6);
INSERT INTO `sys_record` VALUES (3928, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:19:05', 4);
INSERT INTO `sys_record` VALUES (3929, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:19:05', 6);
INSERT INTO `sys_record` VALUES (3930, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:19:14', 1);
INSERT INTO `sys_record` VALUES (3931, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:19:14', 6);
INSERT INTO `sys_record` VALUES (3932, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:19:51', 2);
INSERT INTO `sys_record` VALUES (3933, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:19:51', 7);
INSERT INTO `sys_record` VALUES (3934, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:20:42', 2);
INSERT INTO `sys_record` VALUES (3935, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:20:42', 6);
INSERT INTO `sys_record` VALUES (3936, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:21:01', 1);
INSERT INTO `sys_record` VALUES (3937, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:21:01', 6);
INSERT INTO `sys_record` VALUES (3938, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:21:12', 2);
INSERT INTO `sys_record` VALUES (3939, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:21:12', 6);
INSERT INTO `sys_record` VALUES (3940, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:21:17', 1);
INSERT INTO `sys_record` VALUES (3941, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:21:17', 7);
INSERT INTO `sys_record` VALUES (3942, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:21:22', 2);
INSERT INTO `sys_record` VALUES (3943, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:21:22', 5);
INSERT INTO `sys_record` VALUES (3944, 1467193546766372868, 20, '127.0.0.1', '2021-12-05 02:21:29', 1);
INSERT INTO `sys_record` VALUES (3945, 1467193546766372869, 20, '127.0.0.1', '2021-12-05 02:21:29', 5);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `order` int(11) NOT NULL COMMENT '排序权重',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (5, 'web', 1);
INSERT INTO `tag` VALUES (6, 'java', 2);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类',
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务功能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 646 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (2, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (3, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (4, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (5, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (6, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (7, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (8, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (9, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (10, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (11, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (12, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (13, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (14, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (15, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (16, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (17, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (18, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (19, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (20, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (21, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (22, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (23, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (24, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (25, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (26, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (27, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (28, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (29, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (30, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (31, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (32, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (33, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (34, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (35, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (36, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (37, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (38, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (39, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (40, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (41, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (42, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (43, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (44, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (45, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (46, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (47, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (48, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (49, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (50, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (51, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (52, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (53, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (54, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (55, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (56, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (57, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (58, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (59, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (60, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (61, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (62, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (63, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (64, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (65, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (66, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (67, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (68, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (69, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (70, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (71, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (72, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (73, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (74, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (75, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (76, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (77, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (78, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (79, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (80, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (81, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (82, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (83, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (84, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (85, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (86, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (87, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (88, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (89, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (90, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (91, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (92, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (93, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (94, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (95, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (96, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (97, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (98, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (99, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (100, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (101, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (102, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (103, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (104, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (105, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (106, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (107, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (108, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (109, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (110, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (111, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (112, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (113, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (114, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (115, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (116, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (117, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (118, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (119, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (120, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (121, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (122, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (123, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (124, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (125, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (126, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (127, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (128, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (129, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (130, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (131, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (132, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (133, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (134, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (135, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (136, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (137, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (138, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (139, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (140, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (141, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (142, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (143, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (144, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (145, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (146, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (147, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (148, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (149, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (150, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (151, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (152, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (153, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (154, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (155, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (156, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (157, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (158, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (159, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (160, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (161, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (162, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (163, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (164, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (165, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (166, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (167, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (168, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (169, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (170, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (171, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (172, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (173, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (174, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (175, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (176, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (177, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (178, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (179, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (180, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (181, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (182, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (183, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (184, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (185, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (186, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (187, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (188, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (189, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (190, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (191, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (192, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (193, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (194, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (195, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (196, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (197, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (198, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (199, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (200, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (201, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (202, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (203, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (204, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (205, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (206, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (207, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (208, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (209, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (210, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (211, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (212, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (213, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (214, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (215, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (216, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (217, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (218, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (219, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (220, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (221, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (222, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (223, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (224, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (225, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (226, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (227, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (228, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (229, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (230, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (231, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (232, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (233, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (234, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (235, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (236, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (237, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (238, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (239, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (240, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (241, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (242, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (243, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (244, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (245, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (246, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (247, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (248, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (249, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (250, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (251, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (252, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (253, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (254, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (255, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (256, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (257, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (258, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (259, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (260, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (261, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (262, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (263, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (264, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (265, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (266, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (267, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (268, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (269, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (270, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (271, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (272, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (273, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (274, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (275, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (276, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (277, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (278, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (279, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (280, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (281, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (282, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (283, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (284, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (285, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (286, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (287, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (288, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (289, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (290, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (291, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (292, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (293, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (294, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (295, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (296, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (297, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (298, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (299, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (300, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (301, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (302, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (303, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (304, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (305, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (306, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (307, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (308, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (309, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (310, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (311, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (312, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (313, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (314, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (315, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (316, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (317, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (318, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (319, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (320, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (321, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (322, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (323, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (324, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (325, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (326, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (327, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (328, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (329, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (330, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (331, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (332, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (333, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (334, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (335, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (336, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (337, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (338, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (339, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (340, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (341, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (342, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (343, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (344, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (345, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (346, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (347, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (348, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (349, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (350, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (351, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (352, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (353, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (354, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (355, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (356, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (357, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (358, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (359, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (360, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (361, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (362, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (363, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (364, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (365, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (366, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (367, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (368, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (369, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (370, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (371, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (372, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (373, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (374, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (375, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (376, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (377, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (378, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (379, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (380, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (381, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (382, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (383, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (384, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (385, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (386, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (387, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (388, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (389, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (390, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (391, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (392, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (393, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (394, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (395, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (396, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (397, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (398, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (399, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (400, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (401, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (402, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (403, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (404, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (405, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (406, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (407, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (408, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (409, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (410, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (411, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (412, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (413, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (414, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (415, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (416, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (417, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (418, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (419, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (420, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (421, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (422, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (423, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (424, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (425, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (426, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (427, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (428, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (429, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (430, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (431, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (432, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (433, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (434, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (435, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (436, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (437, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (438, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (439, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (440, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (441, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (442, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (443, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (444, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (445, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (446, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (447, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (448, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (449, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (450, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (451, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (452, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (453, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (454, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (455, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (456, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (457, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (458, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (459, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (460, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (461, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (462, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (463, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (464, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (465, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (466, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (467, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (468, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (469, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (470, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (471, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (472, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (473, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (474, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (475, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (476, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (477, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (478, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (479, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (480, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (481, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (482, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (483, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (484, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (485, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (486, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (487, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (488, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (489, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (490, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (491, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (492, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (493, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (494, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (495, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (496, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (497, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (498, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (499, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (500, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (501, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (502, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (503, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (504, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (505, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (506, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (507, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (508, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (509, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (510, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (511, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (512, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (513, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (514, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (515, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (516, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (517, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (518, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (519, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (520, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (521, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (522, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (523, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (524, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (525, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (526, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (527, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (528, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (529, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (530, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (531, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (532, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (533, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (534, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (535, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (536, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (537, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (538, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (539, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (540, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (541, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (542, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (543, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (544, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (545, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (546, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (547, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (548, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (549, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (550, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (551, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (552, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (553, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (554, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (555, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (556, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (557, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (558, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (559, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (560, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (561, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (562, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (563, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (564, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (565, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (566, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (567, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (568, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (569, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (570, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (571, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (572, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (573, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (574, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (575, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (576, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (577, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (578, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (579, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (580, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (581, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (582, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (583, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (584, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (585, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (586, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (587, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (588, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (589, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (590, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (591, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (592, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (593, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (594, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (595, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (596, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (597, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (598, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (599, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (600, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (601, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (602, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (603, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (604, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (605, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (606, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (607, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (608, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (609, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (610, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (611, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (612, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (613, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (614, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (615, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (616, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (617, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (618, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (619, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (620, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (621, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (622, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (623, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (624, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (625, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (626, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (627, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (628, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (629, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (630, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (631, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (632, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (633, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (634, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (635, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (636, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (637, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (638, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (639, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (640, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (641, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (642, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (643, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (644, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (645, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');

-- ----------------------------
-- Table structure for task_trigger
-- ----------------------------
DROP TABLE IF EXISTS `task_trigger`;
CREATE TABLE `task_trigger`  (
  `trigger_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务描述',
  `cron` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NOT NULL COMMENT '定时任务状态 0 停用,1启用',
  PRIMARY KEY (`trigger_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_trigger
-- ----------------------------
INSERT INTO `task_trigger` VALUES (1, 'T1', '爬虫', '*/10 * * * * ?', 1);

-- ----------------------------
-- Table structure for user_entity
-- ----------------------------
DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE `user_entity`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id，当主键用',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(账户)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志 ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_entity
-- ----------------------------
INSERT INTO `user_entity` VALUES (20, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, 0);
INSERT INTO `user_entity` VALUES (21, 'test1', '5a105e8b9d40e1329780d62ea2265d8a', NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(学号)',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业班级',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我简介\r\n',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志 ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (20, 'admin', '你是基佬', 'data:image/png;base64,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', '我是蓝翔', '1234561234', '654312', 'shit12312', '一起搞基，先生！是的，先生', 0, NULL, '2021-10-17 01:59:59', 0);
INSERT INTO `user_info` VALUES (21, 'test1', '大便', NULL, '阿斯蒂芬撒地方', '撒分色', '瑟夫', '费萨尔费', '你说的附属恶化覅色回复i色回复i规格和', 0, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `delete_flag` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`, `user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (14, 20, 1, '2100-01-01 00:00:00', 0);
INSERT INTO `user_role` VALUES (15, 21, 3, '2021-11-27 00:12:12', 0);

SET FOREIGN_KEY_CHECKS = 1;
