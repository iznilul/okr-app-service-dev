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

 Date: 13/12/2021 13:22:31
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
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 钥匙id',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钥匙名称',
  `status` tinyint(1) NOT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key
-- ----------------------------
INSERT INTO `key` VALUES (11, '四教115', 0, '2021-12-05 23:09:27', '2021-12-06 00:34:48', 0);
INSERT INTO `key` VALUES (12, '四教110', 0, '2021-12-05 23:21:49', '2021-12-06 23:05:39', 0);

-- ----------------------------
-- Table structure for key_user
-- ----------------------------
DROP TABLE IF EXISTS `key_user`;
CREATE TABLE `key_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key_id` int(11) NOT NULL COMMENT '钥匙id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0暂保管 1已归还',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key_user
-- ----------------------------
INSERT INTO `key_user` VALUES (22, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (23, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (24, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (25, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (26, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (27, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (28, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (29, 11, 20, 1, '2021-12-06 00:25:58');
INSERT INTO `key_user` VALUES (30, 11, 20, 1, '2021-12-06 00:28:02');
INSERT INTO `key_user` VALUES (31, 11, 20, 1, '2021-12-06 00:29:51');
INSERT INTO `key_user` VALUES (32, 11, 20, 1, '2021-12-06 00:30:07');
INSERT INTO `key_user` VALUES (33, 11, 20, 1, '2021-12-06 00:34:48');
INSERT INTO `key_user` VALUES (34, 12, 20, 1, '2021-12-06 22:25:32');
INSERT INTO `key_user` VALUES (35, 12, 20, 1, '2021-12-06 23:05:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1467896460384767514 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1467896460384767458, '添加书籍', 'POST', '/api/okr/book/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767459, '借书', 'GET', '/api/okr/book/borrow', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767460, '上传书籍照片', 'GET', '/api/okr/book/changeImg', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767461, '还书', 'GET', '/api/okr/book/return', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767462, '修改书籍', 'POST', '/api/okr/book/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767463, '删除书籍', 'GET', '/api/okr/book/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767464, '书籍列表', 'POST', '/api/okr/book/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767465, '认证测试', 'GET', '/api/okr/common/test', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767466, '用户退出', 'GET', '/api/okr/common/logout', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767467, '用户登录', 'POST', '/api/okr/common/login', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767468, '模糊查询用户名列表', 'GET', '/api/okr/enum/username', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767469, '模糊查询标签', 'GET', '/api/okr/enum/tag', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767470, '模糊查询专业列表', 'GET', '/api/okr/enum/major', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767471, '模糊查询钥匙', 'GET', '/api/okr/enum/key', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767472, '模糊查询角色', 'GET', '/api/okr/enum/role', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767473, '模糊查询成员状态', 'GET', '/api/okr/enum/userStatus', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767474, '模糊查询报名状态', 'GET', '/api/okr/enum/signUpStatus', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767475, '模糊查询姓名列表', 'GET', '/api/okr/enum/name', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767476, '还钥匙', 'GET', '/api/okr/key/return', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767477, '根据id查询钥匙', 'GET', '/api/okr/key/queryById', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767478, '删除钥匙', 'GET', '/api/okr/key/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767479, '增加钥匙', 'GET', '/api/okr/key/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767480, '修改钥匙', 'POST', '/api/okr/key/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767481, '钥匙列表', 'POST', '/api/okr/key/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767482, '借钥匙', 'GET', '/api/okr/key/borrow', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767483, '增加钥匙持有人', 'GET', '/api/okr/keyUser/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767484, '删除钥匙持有人', 'GET', '/api/okr/keyUser/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767485, '钥匙记录列表', 'POST', '/api/okr/keyUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767486, '获取路径', 'GET', '/api/okr/menu/fetch', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767487, '服务器监控', 'GET', '/api/okr/monitor/server', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767488, 'csdn实时展示', 'GET', '/api/okr/rank/csdn', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767489, '获取资源名称', 'GET', '/api/okr/resource/queryName', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767490, '更改接口开放状态', 'GET', '/api/okr/resource/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767491, '获取资源接口', 'POST', '/api/okr/resource/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767492, '纳新报名', 'POST', '/api/okr/signup/add', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767493, '报名结果查询', 'GET', '/api/okr/signup/query', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384767494, '更新报名记录', 'POST', '/api/okr/signup/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767495, '导出报名单', 'GET', '/api/okr/signup/export', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767496, '获取报名记录', 'POST', '/api/okr/signup/queryList', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767497, '操作记录列表', 'POST', '/api/okr/sysRecord/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767498, '更新标签', 'POST', '/api/okr/tag/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767499, '获取标签', 'GET', '/api/okr/tag/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767500, '删除标签', 'GET', '/api/okr/tag/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767501, '增加标签', 'POST', '/api/okr/tag/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767502, '获取标签列表', 'POST', '/api/okr/tag/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767503, '根据用户名选择用户', 'GET', '/api/okr/user/queryByUsername', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767504, '注册用户', 'POST', '/api/okr/user/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767505, '更新用户权限', 'POST', '/api/okr/user/changeRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767506, '上传头像文件', 'POST', '/api/okr/user/changeImg', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767507, '修改密码', 'POST', '/api/okr/user/changePassword', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767508, '更新用户信息', 'POST', '/api/okr/user/change', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767509, '获取用户信息', 'GET', '/api/okr/user/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767510, '删除用户', 'GET', '/api/okr/user/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384767511, '查询用户列表', 'POST', '/api/okr/user/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767512, '获取用户权限信息', 'GET', '/api/okr/user/queryRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384767513, '修改成员的角色权限', 'POST', '/api/okr/userRole/grant', 'superAdmin', 1);

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
INSERT INTO `role` VALUES (1, 'superAdmin', '超级管理');
INSERT INTO `role` VALUES (2, 'admin', '管理员');
INSERT INTO `role` VALUES (3, 'user', '普通用户');
INSERT INTO `role` VALUES (4, 'common', '任何请求');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5418 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (5375, 3, 1001);
INSERT INTO `role_menu` VALUES (5376, 3, 1002);
INSERT INTO `role_menu` VALUES (5377, 3, 1003);
INSERT INTO `role_menu` VALUES (5378, 3, 2000);
INSERT INTO `role_menu` VALUES (5379, 3, 2001);
INSERT INTO `role_menu` VALUES (5380, 3, 2002);
INSERT INTO `role_menu` VALUES (5381, 3, 3000);
INSERT INTO `role_menu` VALUES (5382, 3, 3001);
INSERT INTO `role_menu` VALUES (5383, 3, 3002);
INSERT INTO `role_menu` VALUES (5384, 3, 4000);
INSERT INTO `role_menu` VALUES (5385, 3, 4001);
INSERT INTO `role_menu` VALUES (5386, 2, 1001);
INSERT INTO `role_menu` VALUES (5387, 2, 1002);
INSERT INTO `role_menu` VALUES (5388, 2, 1003);
INSERT INTO `role_menu` VALUES (5389, 2, 2000);
INSERT INTO `role_menu` VALUES (5390, 2, 2001);
INSERT INTO `role_menu` VALUES (5391, 2, 2002);
INSERT INTO `role_menu` VALUES (5392, 2, 3000);
INSERT INTO `role_menu` VALUES (5393, 2, 3001);
INSERT INTO `role_menu` VALUES (5394, 2, 3002);
INSERT INTO `role_menu` VALUES (5395, 2, 4000);
INSERT INTO `role_menu` VALUES (5396, 2, 4001);
INSERT INTO `role_menu` VALUES (5397, 2, 5000);
INSERT INTO `role_menu` VALUES (5398, 2, 5001);
INSERT INTO `role_menu` VALUES (5399, 2, 5002);
INSERT INTO `role_menu` VALUES (5400, 2, 5003);
INSERT INTO `role_menu` VALUES (5401, 2, 5004);
INSERT INTO `role_menu` VALUES (5402, 1, 1001);
INSERT INTO `role_menu` VALUES (5403, 1, 1002);
INSERT INTO `role_menu` VALUES (5404, 1, 1003);
INSERT INTO `role_menu` VALUES (5405, 1, 2000);
INSERT INTO `role_menu` VALUES (5406, 1, 2001);
INSERT INTO `role_menu` VALUES (5407, 1, 2002);
INSERT INTO `role_menu` VALUES (5408, 1, 3000);
INSERT INTO `role_menu` VALUES (5409, 1, 3001);
INSERT INTO `role_menu` VALUES (5410, 1, 3002);
INSERT INTO `role_menu` VALUES (5411, 1, 4000);
INSERT INTO `role_menu` VALUES (5412, 1, 4001);
INSERT INTO `role_menu` VALUES (5413, 1, 5000);
INSERT INTO `role_menu` VALUES (5414, 1, 5001);
INSERT INTO `role_menu` VALUES (5415, 1, 5002);
INSERT INTO `role_menu` VALUES (5416, 1, 5003);
INSERT INTO `role_menu` VALUES (5417, 1, 5004);

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
) ENGINE = InnoDB AUTO_INCREMENT = 39174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (39029, 4, 1467896460384767467);
INSERT INTO `role_resource` VALUES (39030, 4, 1467896460384767466);
INSERT INTO `role_resource` VALUES (39031, 4, 1467896460384767465);
INSERT INTO `role_resource` VALUES (39032, 4, 1467896460384767488);
INSERT INTO `role_resource` VALUES (39033, 4, 1467896460384767493);
INSERT INTO `role_resource` VALUES (39034, 4, 1467896460384767492);
INSERT INTO `role_resource` VALUES (39035, 3, 1467896460384767512);
INSERT INTO `role_resource` VALUES (39036, 3, 1467896460384767507);
INSERT INTO `role_resource` VALUES (39037, 3, 1467896460384767506);
INSERT INTO `role_resource` VALUES (39038, 3, 1467896460384767505);
INSERT INTO `role_resource` VALUES (39039, 3, 1467896460384767511);
INSERT INTO `role_resource` VALUES (39040, 3, 1467896460384767509);
INSERT INTO `role_resource` VALUES (39041, 3, 1467896460384767508);
INSERT INTO `role_resource` VALUES (39042, 3, 1467896460384767503);
INSERT INTO `role_resource` VALUES (39043, 3, 1467896460384767502);
INSERT INTO `role_resource` VALUES (39044, 3, 1467896460384767488);
INSERT INTO `role_resource` VALUES (39045, 3, 1467896460384767493);
INSERT INTO `role_resource` VALUES (39046, 3, 1467896460384767492);
INSERT INTO `role_resource` VALUES (39047, 3, 1467896460384767482);
INSERT INTO `role_resource` VALUES (39048, 3, 1467896460384767481);
INSERT INTO `role_resource` VALUES (39049, 3, 1467896460384767487);
INSERT INTO `role_resource` VALUES (39050, 3, 1467896460384767486);
INSERT INTO `role_resource` VALUES (39051, 3, 1467896460384767485);
INSERT INTO `role_resource` VALUES (39052, 3, 1467896460384767475);
INSERT INTO `role_resource` VALUES (39053, 3, 1467896460384767473);
INSERT INTO `role_resource` VALUES (39054, 3, 1467896460384767472);
INSERT INTO `role_resource` VALUES (39055, 3, 1467896460384767476);
INSERT INTO `role_resource` VALUES (39056, 3, 1467896460384767467);
INSERT INTO `role_resource` VALUES (39057, 3, 1467896460384767466);
INSERT INTO `role_resource` VALUES (39058, 3, 1467896460384767465);
INSERT INTO `role_resource` VALUES (39059, 3, 1467896460384767464);
INSERT INTO `role_resource` VALUES (39060, 3, 1467896460384767471);
INSERT INTO `role_resource` VALUES (39061, 3, 1467896460384767470);
INSERT INTO `role_resource` VALUES (39062, 3, 1467896460384767468);
INSERT INTO `role_resource` VALUES (39063, 2, 1467896460384767512);
INSERT INTO `role_resource` VALUES (39064, 2, 1467896460384767507);
INSERT INTO `role_resource` VALUES (39065, 2, 1467896460384767506);
INSERT INTO `role_resource` VALUES (39066, 2, 1467896460384767505);
INSERT INTO `role_resource` VALUES (39067, 2, 1467896460384767504);
INSERT INTO `role_resource` VALUES (39068, 2, 1467896460384767511);
INSERT INTO `role_resource` VALUES (39069, 2, 1467896460384767510);
INSERT INTO `role_resource` VALUES (39070, 2, 1467896460384767509);
INSERT INTO `role_resource` VALUES (39071, 2, 1467896460384767508);
INSERT INTO `role_resource` VALUES (39072, 2, 1467896460384767499);
INSERT INTO `role_resource` VALUES (39073, 2, 1467896460384767498);
INSERT INTO `role_resource` VALUES (39074, 2, 1467896460384767497);
INSERT INTO `role_resource` VALUES (39075, 2, 1467896460384767496);
INSERT INTO `role_resource` VALUES (39076, 2, 1467896460384767503);
INSERT INTO `role_resource` VALUES (39077, 2, 1467896460384767502);
INSERT INTO `role_resource` VALUES (39078, 2, 1467896460384767501);
INSERT INTO `role_resource` VALUES (39079, 2, 1467896460384767500);
INSERT INTO `role_resource` VALUES (39080, 2, 1467896460384767491);
INSERT INTO `role_resource` VALUES (39081, 2, 1467896460384767490);
INSERT INTO `role_resource` VALUES (39082, 2, 1467896460384767489);
INSERT INTO `role_resource` VALUES (39083, 2, 1467896460384767488);
INSERT INTO `role_resource` VALUES (39084, 2, 1467896460384767495);
INSERT INTO `role_resource` VALUES (39085, 2, 1467896460384767494);
INSERT INTO `role_resource` VALUES (39086, 2, 1467896460384767493);
INSERT INTO `role_resource` VALUES (39087, 2, 1467896460384767492);
INSERT INTO `role_resource` VALUES (39088, 2, 1467896460384767483);
INSERT INTO `role_resource` VALUES (39089, 2, 1467896460384767482);
INSERT INTO `role_resource` VALUES (39090, 2, 1467896460384767481);
INSERT INTO `role_resource` VALUES (39091, 2, 1467896460384767480);
INSERT INTO `role_resource` VALUES (39092, 2, 1467896460384767487);
INSERT INTO `role_resource` VALUES (39093, 2, 1467896460384767486);
INSERT INTO `role_resource` VALUES (39094, 2, 1467896460384767485);
INSERT INTO `role_resource` VALUES (39095, 2, 1467896460384767484);
INSERT INTO `role_resource` VALUES (39096, 2, 1467896460384767475);
INSERT INTO `role_resource` VALUES (39097, 2, 1467896460384767474);
INSERT INTO `role_resource` VALUES (39098, 2, 1467896460384767473);
INSERT INTO `role_resource` VALUES (39099, 2, 1467896460384767472);
INSERT INTO `role_resource` VALUES (39100, 2, 1467896460384767479);
INSERT INTO `role_resource` VALUES (39101, 2, 1467896460384767478);
INSERT INTO `role_resource` VALUES (39102, 2, 1467896460384767477);
INSERT INTO `role_resource` VALUES (39103, 2, 1467896460384767476);
INSERT INTO `role_resource` VALUES (39104, 2, 1467896460384767467);
INSERT INTO `role_resource` VALUES (39105, 2, 1467896460384767466);
INSERT INTO `role_resource` VALUES (39106, 2, 1467896460384767465);
INSERT INTO `role_resource` VALUES (39107, 2, 1467896460384767464);
INSERT INTO `role_resource` VALUES (39108, 2, 1467896460384767471);
INSERT INTO `role_resource` VALUES (39109, 2, 1467896460384767470);
INSERT INTO `role_resource` VALUES (39110, 2, 1467896460384767469);
INSERT INTO `role_resource` VALUES (39111, 2, 1467896460384767468);
INSERT INTO `role_resource` VALUES (39112, 2, 1467896460384767459);
INSERT INTO `role_resource` VALUES (39113, 2, 1467896460384767458);
INSERT INTO `role_resource` VALUES (39114, 2, 1467896460384767463);
INSERT INTO `role_resource` VALUES (39115, 2, 1467896460384767462);
INSERT INTO `role_resource` VALUES (39116, 2, 1467896460384767461);
INSERT INTO `role_resource` VALUES (39117, 2, 1467896460384767460);
INSERT INTO `role_resource` VALUES (39118, 1, 1467896460384767513);
INSERT INTO `role_resource` VALUES (39119, 1, 1467896460384767512);
INSERT INTO `role_resource` VALUES (39120, 1, 1467896460384767507);
INSERT INTO `role_resource` VALUES (39121, 1, 1467896460384767506);
INSERT INTO `role_resource` VALUES (39122, 1, 1467896460384767505);
INSERT INTO `role_resource` VALUES (39123, 1, 1467896460384767504);
INSERT INTO `role_resource` VALUES (39124, 1, 1467896460384767511);
INSERT INTO `role_resource` VALUES (39125, 1, 1467896460384767510);
INSERT INTO `role_resource` VALUES (39126, 1, 1467896460384767509);
INSERT INTO `role_resource` VALUES (39127, 1, 1467896460384767508);
INSERT INTO `role_resource` VALUES (39128, 1, 1467896460384767499);
INSERT INTO `role_resource` VALUES (39129, 1, 1467896460384767498);
INSERT INTO `role_resource` VALUES (39130, 1, 1467896460384767497);
INSERT INTO `role_resource` VALUES (39131, 1, 1467896460384767496);
INSERT INTO `role_resource` VALUES (39132, 1, 1467896460384767503);
INSERT INTO `role_resource` VALUES (39133, 1, 1467896460384767502);
INSERT INTO `role_resource` VALUES (39134, 1, 1467896460384767501);
INSERT INTO `role_resource` VALUES (39135, 1, 1467896460384767500);
INSERT INTO `role_resource` VALUES (39136, 1, 1467896460384767491);
INSERT INTO `role_resource` VALUES (39137, 1, 1467896460384767490);
INSERT INTO `role_resource` VALUES (39138, 1, 1467896460384767489);
INSERT INTO `role_resource` VALUES (39139, 1, 1467896460384767488);
INSERT INTO `role_resource` VALUES (39140, 1, 1467896460384767495);
INSERT INTO `role_resource` VALUES (39141, 1, 1467896460384767494);
INSERT INTO `role_resource` VALUES (39142, 1, 1467896460384767493);
INSERT INTO `role_resource` VALUES (39143, 1, 1467896460384767492);
INSERT INTO `role_resource` VALUES (39144, 1, 1467896460384767483);
INSERT INTO `role_resource` VALUES (39145, 1, 1467896460384767482);
INSERT INTO `role_resource` VALUES (39146, 1, 1467896460384767481);
INSERT INTO `role_resource` VALUES (39147, 1, 1467896460384767480);
INSERT INTO `role_resource` VALUES (39148, 1, 1467896460384767487);
INSERT INTO `role_resource` VALUES (39149, 1, 1467896460384767486);
INSERT INTO `role_resource` VALUES (39150, 1, 1467896460384767485);
INSERT INTO `role_resource` VALUES (39151, 1, 1467896460384767484);
INSERT INTO `role_resource` VALUES (39152, 1, 1467896460384767475);
INSERT INTO `role_resource` VALUES (39153, 1, 1467896460384767474);
INSERT INTO `role_resource` VALUES (39154, 1, 1467896460384767473);
INSERT INTO `role_resource` VALUES (39155, 1, 1467896460384767472);
INSERT INTO `role_resource` VALUES (39156, 1, 1467896460384767479);
INSERT INTO `role_resource` VALUES (39157, 1, 1467896460384767478);
INSERT INTO `role_resource` VALUES (39158, 1, 1467896460384767477);
INSERT INTO `role_resource` VALUES (39159, 1, 1467896460384767476);
INSERT INTO `role_resource` VALUES (39160, 1, 1467896460384767467);
INSERT INTO `role_resource` VALUES (39161, 1, 1467896460384767466);
INSERT INTO `role_resource` VALUES (39162, 1, 1467896460384767465);
INSERT INTO `role_resource` VALUES (39163, 1, 1467896460384767464);
INSERT INTO `role_resource` VALUES (39164, 1, 1467896460384767471);
INSERT INTO `role_resource` VALUES (39165, 1, 1467896460384767470);
INSERT INTO `role_resource` VALUES (39166, 1, 1467896460384767469);
INSERT INTO `role_resource` VALUES (39167, 1, 1467896460384767468);
INSERT INTO `role_resource` VALUES (39168, 1, 1467896460384767459);
INSERT INTO `role_resource` VALUES (39169, 1, 1467896460384767458);
INSERT INTO `role_resource` VALUES (39170, 1, 1467896460384767463);
INSERT INTO `role_resource` VALUES (39171, 1, 1467896460384767462);
INSERT INTO `role_resource` VALUES (39172, 1, 1467896460384767461);
INSERT INTO `role_resource` VALUES (39173, 1, 1467896460384767460);

-- ----------------------------
-- Table structure for sign_up
-- ----------------------------
DROP TABLE IF EXISTS `sign_up`;
CREATE TABLE `sign_up`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign_up
-- ----------------------------
INSERT INTO `sign_up` VALUES (2, '18110571234', '程成', '男', '501966782', '信管本2002', '熟悉golang。Java。cpp。vue。熟悉开源社区。github.com/devhg。熟悉Linux   ', 1, '你太牛逼啦', NULL, '2021-12-12 22:01:39');
INSERT INTO `sign_up` VALUES (3, '19111405056', '杨叶江', '男', '424133224', '工商1902', '目前属于基础检查，目标方向是为了能运用Python进行数据分析等，无项目经历。\n竞赛主要有省级三项，校级奖项若干', 1, '是的先生', NULL, '2021-12-12 22:02:04');
INSERT INTO `sign_up` VALUES (4, '19111407001', '宣佳栋', '男', '1413452856', '市销1901', '       在思想方面，本人理想信念坚定，积极向党组织靠拢。\n       在工作方面，担任班级学习委员，青年服务部工作人员，课程助理，市销2001班带班，积极为老师排忧解难。\n       在学习方面，学习认真努力，成绩优异，当前学业成绩和综合测评成绩均位于专业第一位，被授予校级“优秀学生”、“优秀共青团员”等称号，并获得校级二等奖学金。\n       在比赛方面，积极参加大型比赛，曾获：\n1.全国花间校园街坊总站国家级优秀奖\n2.“尖峰时刻”全球案例大赛省级一等奖\n3.全国大学生工程训练综合能力竞赛省级二等奖\n4.全国大学生市场调查与分析大赛省级三等奖\n5.“挑战杯”大学生课外学术科技作品大赛校级三等奖\n6.淄博市“创意青春 智赢未来”营销方案设计大赛市级二等奖\n7.山东理工大学青春踏歌行合唱比赛校级特等奖\n8.第一届山东理工大学创新方法应用大赛校级三等奖\n9.山东理工大学大学生科技创新大赛校级三等奖\n10.山东理工大学青年创客挑战赛校级优秀奖\n11.第三届全国管理模拟决策大赛校级三等奖\n12.第四届全国管理模拟决策大赛校级二等奖\n13.“庆国庆 青年行”爱国寻图比赛校级一等奖\n14.全国大学生电子商务“创新 创意 创业”挑战赛校级二等奖\n       在社会实践方面，两次获得社会实践校级奖项，被授予“社会实践先进个人”称号。\n       在科研成果方面，跟随导师进行小农户与现代化衔接方面的研究，自学SPSS分析、Java和citespace，并主持校级立项一项。\n', 2, '小庙难容大佛', NULL, '2021-12-12 22:02:20');
INSERT INTO `sign_up` VALUES (5, '19111408015', '孙淼', '男', '1873365757', '信管1901', 'JAVA浅层次内容完成\nSQL语句浅层次\n周一上午\n周二晚上\n周三晚上\n周四下午晚上\n周五晚上', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (6, '19111408022', '杨光秋', '男', '1980820857', '信管1901', '1.现在在学java，感觉java想要深入掌握，是需要有专业老师教授。所以在专业课教学java语言和SQL Server，我希望能够通过信息技术实验室能另外掌握重要的python语言和c语言。\n\n2.我的目标是希望能够毕业掌握java语言，精通python语言和c语言，能够学到可以单人开发一些小项目小程序，能够有能力成为大项目开发团队的一员，甚至作为大项目开发经理。\n\n3.已经学完java语言基础、流程控制、数组与字符串（数据结构与算法分析学习完线性表、栈和队列）和Mysql的基础。\n接下去几周学习java语言类特性，继承、抽象类、接口和枚举，异常处理，java语言的输入输出与文件处理等，相关数据结构与算法分析，学习完mysql的基础内容。\n', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (7, '19111408041', '曹渊博', '男', '2985958099', '信管1902', '目前java学完多线程，下一步想学一下算法，前端想再放一放在学，大二学生会也能退了之后就好好学习去了，实验室大概一个星期能去四次左右', 1, '是的先生', NULL, '2021-12-13 00:36:28');
INSERT INTO `sign_up` VALUES (8, '19111493015', '卢玉栋', '男', '2191387440', '信管本1901', '学了java流程控制，包括分支结构，循环结构，和跳转语句。定义数组与字符串。了解类，java输入输出与文件处理，学习了使用sql语句进行数据库管理，表的管理和应用，想从事大数据开发\n每周有时间就可以去实验室，白天有课，每天晚上可以去，周末', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (9, '19111493055', '陈建军', '男', '1727072639', '信管本1902', '了解Java、C、Python，了解SSM,SpringBoot框架，了解数据库的使用，会使用Git上传项目，会简单使用Linux操作系统，了解Docker容器，会使用ElasticSearch和Redis，了解Hadoop框架。\n目标方向是JavaWeb开发\n项目经历：1、微小型跨组织人才管理系统 2、绿色低碳出行微信小程序 3、员工管理系统\nCSDN: https://blog.csdn.net/qq_40266349?spm=1000.2115.3001.5343\nGitHub: https://github.com/JackYangyang0\n获奖：第六届节能减排社会实践与科技竞赛校二等奖且进入国赛', 1, '不是很硬', NULL, '2021-12-13 00:42:15');
INSERT INTO `sign_up` VALUES (10, '19111493063', '王金浩', '男', '1253912723', '信管本1902', '大一学期专业课学过Java，上下学期考试均90分以上。基本例题都基本掌握。对python 感兴趣，目前已经开始学习！加入实验室的目的是想跟同学们一起交流学习，做一些创新性的事情。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (11, '19121406076', '王若冰', '女', '872184581', '工业1902', '目前初次接触python，系统学过计算机导论，熟悉较为简单的mathematica，接触过MATLAB，目标方向数据分析、算法优化，已取得四级证书、计算机二级证，大英赛二等奖，山东省数学竞赛三等奖，参与多项创新创业类竞赛，负责大创项目一项，对计算机软件学习保有热情，希望进步', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (12, '19121408037', '蔡春雨', '女', '1723612044', '信管1901', '获得计算机二级证书mysql数据库程序设计', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (13, '19121408074', '唐境锶', '女', '1945938350', '信管1902', '学过一些HTMLcssjs java mysql sqlsever 不是很厉害的那种程度 周四周天', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (14, '19121408075', '王梦瑶', '女', '1486102538', '信管1902', '目前掌握java的控制语句和方法内容，在进一步学习中，目标是能有自主开发编写程序的能力，暂无项目经历\n通过b站的java相关视频和csdn的相关知识自学', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (15, '19121493034', '贾聪聪', '女', '1541163933', '信管本1901', '自学Java', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (17, '20111405008', '刘浩伟', '男', '209478845', '工商2002', '我擅长C语言和一些基础算法，做一些算法题目，并且自学了数据结构(不过还没学完)，未来的目标是学习完数据结构和一些算法后，学习一些前端知识和计网知识，增加自己的技术面。除此之外，我也想参加一些比赛，如算法竞赛，关于计算机的比赛等，开阔自己的眼界。个人博客地址: https://blog.csdn.net/weixin_55812984。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (18, '20111407001', '周洪燊', '男', '2160915425', '市销2002', '自己对于编程掌握的不是很多，但是最近一直在学习python，对于python的一些基本规则和一些函数都有所了解掌握；自己目标方向就是可以全面地掌握编程，对于编程不同的种类技术都有所了解；自己没有什么项目经历，属于刚学编程的小白，但是自己可以学习，也相信自己会逐渐精通编程；自己的自学能力还算可以，对于新知识学得还算比较快，对于理科的一些知识学得会更快，理解得也会更快，因此我相信我会很快地融入到这个集体。', 2, '咚咚恰', NULL, '2021-12-13 00:42:40');
INSERT INTO `sign_up` VALUES (19, '20111408012', '张义龙', '男', '568933962', '信管2002班', '个人暂时为java萌新，想学好java，暂时在刷山理工的oj和看哔站的教程，接触过citespace所以自己也想用java做出一个程序(如游戏)。对编程感兴趣，愿意去主动找到更多的资源去学习，让自己成长。去实验室的时间是周四周五下午可以去，下晚自习可以去。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (20, '20111408016', '马元麒', '男', '2804120991', '信管2002', '上学期学了HTML5、CSS、JS等等前端知识，已经会熟练制作静态网页，能对于一个现成的网页进行重新修改，并且学习了PHP，会对数据库进行基础操作，在寒假期间用php以及前端知识做出了自己的博客，可以实现增删改查，注册、登录、分页等等，但是还在本地保留，没有放到网站上（没有进行美化，太丑了）我也是青春在线程序部常驻志愿者，在那学习后端，laravel框架，网站构建知识，在寒假期间也参加了一个学长带队的互联网➕项目，在那里负责前端页面制作美化等等。我也学习java，前段时间刷了山东理工oj上的120多道题目，但是最近没做，最近一直在看bootstrape和js动态网页的制作，做了一个简单实时判断输入框输入内容长度的注册页面，准备再看看移动端网页适配的问题，我周一到周五晚上都可以去，周六在西校程序部培训学习，周天可能去西校做前端或者学网站搭建。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (21, '20111408050', '张森', '男', '1741927235', '信管2001', 'Language：Java, html, C（正在学）\nTarget：1.熟练运用Java和C,可以参加项目设计\n             2.深入学习算法和数据结构\n             3.可以独立制作，参加有水平的比赛\nTime：每天都能来实验室自习；\n           有课时如没特殊情况至少每晚都能来；\n           \n            ', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (22, '20121408020', '万蝶依', '女', '2433215310', '信管2002', '学习JAVA语言，在acm上做一些实验题，现在做到130道题目，对于编程有非常基础的了解，比较感兴趣，想要更加深入的了解编程的应用，将其快速的应用到现实中。寒假中对数据的处理有了一点点的了解。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (23, '20121408022', '韩雨欣', '女', '3240261856', '信息管理与信息系统专业2002', '目标熟练掌握JAVA。学习数据库', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (24, '20121408029', '曹雪', '女', '1369240484', '信管2002', '1.熟悉Java语言，有一定的Java基础。\n2.了解c语言，HTML，PHP，曾与伙伴合作写过一个网页。\n3.目前正在自学算法，数据结构，计算机组成原理。\n4.目标方向是web前后端开发(全栈)。\n', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (25, '20121408039', '李贝贝', '女', '1410851521', '信管2002', '具有一定的自学能力，对制作网页及app具有较强的学习兴趣。希望自己可以独立制作出一个网页，或是app', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (26, '20121408061', '张玉洁', '女', '2889770573', '信管2001', '现在是大一阶段，正在学习Java、C编程语言，接触了前端HTML CSS，有一定的自学能力，目前还没有比较明确的目标方向，对编程感兴趣，准备继续学习数据结构及算法方面的知识，渴望与志同道合的小伙伴一起交流学习。如果能加入实验室大家庭，我应该每天都会来实验室学习。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (27, '20121408071', '曹琪', '女', '1138576292', '信管2001', '对计算机方向很感兴趣，想要进一步了解前端技术。虽然目前技术还处于基础阶段，但是我会很努力的。\n(去实验室的时间:只要是我没课的时候都可以去，包括假期我也都是留校)', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (28, '20121493080', '葛越荷', '女', '1787738998', '信管本2001', '主要学习JAVA相关知识，会不断复习学过的JAVA知识，并且开始学习一部分c语言知识。希望以后在研究生阶段进行学习软件开发的方向，所以会在大学开始就为考试做准备。', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_record`;
CREATE TABLE `sys_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问资源路径',
  `username` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `duration` int(11) NULL DEFAULT NULL COMMENT '用时 单位ms',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES (4440, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-07 01:34:04', 20);
INSERT INTO `sys_record` VALUES (4441, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-07 01:34:07', 18);
INSERT INTO `sys_record` VALUES (4442, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:34:22', 4);
INSERT INTO `sys_record` VALUES (4443, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:35:20', 11);
INSERT INTO `sys_record` VALUES (4444, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:38:30', 6);
INSERT INTO `sys_record` VALUES (4445, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:40:08', 3);
INSERT INTO `sys_record` VALUES (4446, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:40:35', 2);
INSERT INTO `sys_record` VALUES (4447, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:44:04', 8);
INSERT INTO `sys_record` VALUES (4448, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:06', 10);
INSERT INTO `sys_record` VALUES (4449, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:39', 9);
INSERT INTO `sys_record` VALUES (4450, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:45', 4);
INSERT INTO `sys_record` VALUES (4451, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:48:02', 4);
INSERT INTO `sys_record` VALUES (4452, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-07 23:11:32', 1951);
INSERT INTO `sys_record` VALUES (4453, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-07 23:56:23', 172);
INSERT INTO `sys_record` VALUES (4454, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 23:57:46', 9);
INSERT INTO `sys_record` VALUES (4455, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:01:11', 2);
INSERT INTO `sys_record` VALUES (4456, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 00:01:11', 9);
INSERT INTO `sys_record` VALUES (4457, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 00:01:34', 2);
INSERT INTO `sys_record` VALUES (4458, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 00:01:34', 2);
INSERT INTO `sys_record` VALUES (4459, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-08 00:01:50', 7066);
INSERT INTO `sys_record` VALUES (4460, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 00:01:50', 7);
INSERT INTO `sys_record` VALUES (4461, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:02:59', 1556);
INSERT INTO `sys_record` VALUES (4462, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:05:20', 9039);
INSERT INTO `sys_record` VALUES (4463, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:09:26', 6932);
INSERT INTO `sys_record` VALUES (4464, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:14:43', 7);
INSERT INTO `sys_record` VALUES (4465, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:14:56', 4);
INSERT INTO `sys_record` VALUES (4466, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:16:33', 4);
INSERT INTO `sys_record` VALUES (4467, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:16:42', 5);
INSERT INTO `sys_record` VALUES (4468, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:18:41', 12);
INSERT INTO `sys_record` VALUES (4469, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:19:55', 10);
INSERT INTO `sys_record` VALUES (4470, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:20:00', 2);
INSERT INTO `sys_record` VALUES (4471, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:21:53', 6);
INSERT INTO `sys_record` VALUES (4472, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:23:56', 12);
INSERT INTO `sys_record` VALUES (4473, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:24:57', 1);
INSERT INTO `sys_record` VALUES (4474, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:26:28', 2);
INSERT INTO `sys_record` VALUES (4475, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:26:56', 1);
INSERT INTO `sys_record` VALUES (4476, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:27:27', 1);
INSERT INTO `sys_record` VALUES (4477, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:28:05', 4);
INSERT INTO `sys_record` VALUES (4478, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:28:05', 5);
INSERT INTO `sys_record` VALUES (4479, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:29:02', 3);
INSERT INTO `sys_record` VALUES (4480, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:29:02', 5);
INSERT INTO `sys_record` VALUES (4481, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:29:15', 4);
INSERT INTO `sys_record` VALUES (4482, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:31:30', 51);
INSERT INTO `sys_record` VALUES (4483, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:30', 35);
INSERT INTO `sys_record` VALUES (4484, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:32', 7);
INSERT INTO `sys_record` VALUES (4485, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:33', 4);
INSERT INTO `sys_record` VALUES (4486, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:36', 3);
INSERT INTO `sys_record` VALUES (4487, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:38', 4);
INSERT INTO `sys_record` VALUES (4488, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:40', 4);
INSERT INTO `sys_record` VALUES (4489, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:42', 3);
INSERT INTO `sys_record` VALUES (4490, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:33:37', 4);
INSERT INTO `sys_record` VALUES (4491, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:34:46', 2);
INSERT INTO `sys_record` VALUES (4492, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:34:46', 5);
INSERT INTO `sys_record` VALUES (4493, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:36:02', 2);
INSERT INTO `sys_record` VALUES (4494, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:36:02', 4);
INSERT INTO `sys_record` VALUES (4495, '模糊查询专业列表', '/api/okr/enum/major', 'admin', '127.0.0.1', '2021-12-08 00:37:26', 6);
INSERT INTO `sys_record` VALUES (4496, '模糊查询姓名列表', '/api/okr/enum/name', 'admin', '127.0.0.1', '2021-12-08 00:37:28', 2);
INSERT INTO `sys_record` VALUES (4497, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:40:20', 7);
INSERT INTO `sys_record` VALUES (4498, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:42:35', 5);
INSERT INTO `sys_record` VALUES (4499, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:45:04', 5);
INSERT INTO `sys_record` VALUES (4500, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:01', 2);
INSERT INTO `sys_record` VALUES (4501, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:09', 2);
INSERT INTO `sys_record` VALUES (4502, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:53:11', 2);
INSERT INTO `sys_record` VALUES (4503, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:11', 2);
INSERT INTO `sys_record` VALUES (4504, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:54:57', 11);
INSERT INTO `sys_record` VALUES (4505, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:55:16', 2);
INSERT INTO `sys_record` VALUES (4506, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:55:16', 6);
INSERT INTO `sys_record` VALUES (4507, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:03', 6);
INSERT INTO `sys_record` VALUES (4508, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:21', 1);
INSERT INTO `sys_record` VALUES (4509, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:23', 2);
INSERT INTO `sys_record` VALUES (4510, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:23', 2);
INSERT INTO `sys_record` VALUES (4511, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:24', 4);
INSERT INTO `sys_record` VALUES (4512, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:50', 3);
INSERT INTO `sys_record` VALUES (4513, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:57', 4);
INSERT INTO `sys_record` VALUES (4514, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:03', 2);
INSERT INTO `sys_record` VALUES (4515, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:06', 4);
INSERT INTO `sys_record` VALUES (4516, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:10', 4);
INSERT INTO `sys_record` VALUES (4517, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:58:26', 10);
INSERT INTO `sys_record` VALUES (4518, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:58:30', 3);
INSERT INTO `sys_record` VALUES (4519, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:15', 4);
INSERT INTO `sys_record` VALUES (4520, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:28', 3);
INSERT INTO `sys_record` VALUES (4521, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:29', 6);
INSERT INTO `sys_record` VALUES (4522, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 01:15:33', 1);
INSERT INTO `sys_record` VALUES (4523, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 01:15:35', 1);
INSERT INTO `sys_record` VALUES (4524, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:36', 4);
INSERT INTO `sys_record` VALUES (4525, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:44', 2);
INSERT INTO `sys_record` VALUES (4526, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:16:03', 5);
INSERT INTO `sys_record` VALUES (4527, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:27:42', 29);
INSERT INTO `sys_record` VALUES (4528, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:46', 2);
INSERT INTO `sys_record` VALUES (4529, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:27:47', 0);
INSERT INTO `sys_record` VALUES (4530, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:50', 1);
INSERT INTO `sys_record` VALUES (4531, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:52', 1);
INSERT INTO `sys_record` VALUES (4532, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:27:53', 0);
INSERT INTO `sys_record` VALUES (4533, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:53', 1);
INSERT INTO `sys_record` VALUES (4534, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:56', 1);
INSERT INTO `sys_record` VALUES (4535, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:28:05', 1);
INSERT INTO `sys_record` VALUES (4536, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:32:33', 1);
INSERT INTO `sys_record` VALUES (4537, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:32:33', 10);
INSERT INTO `sys_record` VALUES (4538, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:32:35', 2);
INSERT INTO `sys_record` VALUES (4539, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:32:36', 0);
INSERT INTO `sys_record` VALUES (4540, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:33:45', 1);
INSERT INTO `sys_record` VALUES (4541, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:33:45', 8);
INSERT INTO `sys_record` VALUES (4542, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:14', 1);
INSERT INTO `sys_record` VALUES (4543, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:15', 0);
INSERT INTO `sys_record` VALUES (4544, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:34:17', 1);
INSERT INTO `sys_record` VALUES (4545, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:34:17', 6);
INSERT INTO `sys_record` VALUES (4546, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:19', 2);
INSERT INTO `sys_record` VALUES (4547, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:19', 0);
INSERT INTO `sys_record` VALUES (4548, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:22', 2);
INSERT INTO `sys_record` VALUES (4549, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:27', 2);
INSERT INTO `sys_record` VALUES (4550, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:30', 1);
INSERT INTO `sys_record` VALUES (4551, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:36', 1);
INSERT INTO `sys_record` VALUES (4552, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:37', 0);
INSERT INTO `sys_record` VALUES (4553, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:35:33', 1);
INSERT INTO `sys_record` VALUES (4554, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:35:33', 0);
INSERT INTO `sys_record` VALUES (4555, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 23:55:17', 112);
INSERT INTO `sys_record` VALUES (4556, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-08 23:55:19', 2176);
INSERT INTO `sys_record` VALUES (4557, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 23:55:25', 258);
INSERT INTO `sys_record` VALUES (4558, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-08 23:55:26', 14);
INSERT INTO `sys_record` VALUES (4559, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:27', 4);
INSERT INTO `sys_record` VALUES (4560, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-08 23:55:31', 2);
INSERT INTO `sys_record` VALUES (4561, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:32', 0);
INSERT INTO `sys_record` VALUES (4562, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:36', 0);
INSERT INTO `sys_record` VALUES (4563, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 00:01:53', 32);
INSERT INTO `sys_record` VALUES (4564, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 00:01:53', 45);
INSERT INTO `sys_record` VALUES (4565, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:01:55', 16);
INSERT INTO `sys_record` VALUES (4566, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:01:55', 2);
INSERT INTO `sys_record` VALUES (4567, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 00:03:52', 26);
INSERT INTO `sys_record` VALUES (4568, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:54', 12);
INSERT INTO `sys_record` VALUES (4569, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:03:54', 1);
INSERT INTO `sys_record` VALUES (4570, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:56', 2);
INSERT INTO `sys_record` VALUES (4571, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:03:57', 0);
INSERT INTO `sys_record` VALUES (4572, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:58', 1);
INSERT INTO `sys_record` VALUES (4573, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 22:37:11', 178);
INSERT INTO `sys_record` VALUES (4574, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-09 22:37:13', 2271);
INSERT INTO `sys_record` VALUES (4575, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:39:19', 87);
INSERT INTO `sys_record` VALUES (4576, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:21', 15);
INSERT INTO `sys_record` VALUES (4577, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:39:22', 3);
INSERT INTO `sys_record` VALUES (4578, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:25', 2);
INSERT INTO `sys_record` VALUES (4579, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:39:26', 0);
INSERT INTO `sys_record` VALUES (4580, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:39:49', 489);
INSERT INTO `sys_record` VALUES (4581, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:39:49', 8);
INSERT INTO `sys_record` VALUES (4582, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:52', 2);
INSERT INTO `sys_record` VALUES (4583, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:40:01', 1);
INSERT INTO `sys_record` VALUES (4584, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:02', 0);
INSERT INTO `sys_record` VALUES (4585, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:07', 1);
INSERT INTO `sys_record` VALUES (4586, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:40:08', 360);
INSERT INTO `sys_record` VALUES (4587, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:40:08', 6);
INSERT INTO `sys_record` VALUES (4588, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:40:50', 3);
INSERT INTO `sys_record` VALUES (4589, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:54', 1);
INSERT INTO `sys_record` VALUES (4590, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:40:56', 105);
INSERT INTO `sys_record` VALUES (4591, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:40:56', 8);
INSERT INTO `sys_record` VALUES (4592, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:21', 12);
INSERT INTO `sys_record` VALUES (4593, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:43', 5);
INSERT INTO `sys_record` VALUES (4594, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:52', 5);
INSERT INTO `sys_record` VALUES (4595, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:56', 4);
INSERT INTO `sys_record` VALUES (4596, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:45:30', 4);
INSERT INTO `sys_record` VALUES (4597, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:45:37', 3);
INSERT INTO `sys_record` VALUES (4598, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:52:53', 6);
INSERT INTO `sys_record` VALUES (4599, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:52:55', 2);
INSERT INTO `sys_record` VALUES (4600, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:53:15', 132);
INSERT INTO `sys_record` VALUES (4601, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:53:15', 9);
INSERT INTO `sys_record` VALUES (4602, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:53:20', 3);
INSERT INTO `sys_record` VALUES (4603, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:54:12', 1);
INSERT INTO `sys_record` VALUES (4604, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:25', 9867);
INSERT INTO `sys_record` VALUES (4605, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:37', 8293);
INSERT INTO `sys_record` VALUES (4606, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:51', 1);
INSERT INTO `sys_record` VALUES (4607, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:56:15', 19561);
INSERT INTO `sys_record` VALUES (4608, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:56:15', 4);
INSERT INTO `sys_record` VALUES (4609, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:59:13', 33);
INSERT INTO `sys_record` VALUES (4610, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:59:14', 37);
INSERT INTO `sys_record` VALUES (4611, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:59:15', 2);
INSERT INTO `sys_record` VALUES (4612, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:59:21', 2014);
INSERT INTO `sys_record` VALUES (4613, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:59:21', 7);
INSERT INTO `sys_record` VALUES (4614, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:59:42', 7);
INSERT INTO `sys_record` VALUES (4615, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 23:04:19', 2);
INSERT INTO `sys_record` VALUES (4616, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-09 23:04:19', 18);
INSERT INTO `sys_record` VALUES (4617, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:16:50', 10);
INSERT INTO `sys_record` VALUES (4618, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-10 00:17:04', 9);
INSERT INTO `sys_record` VALUES (4619, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-10 00:17:05', 21);
INSERT INTO `sys_record` VALUES (4620, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-10 00:17:06', 9);
INSERT INTO `sys_record` VALUES (4621, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:17:13', 4);
INSERT INTO `sys_record` VALUES (4622, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 00:18:40', 2);
INSERT INTO `sys_record` VALUES (4623, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:18:40', 4);
INSERT INTO `sys_record` VALUES (4624, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 01:12:47', 3);
INSERT INTO `sys_record` VALUES (4625, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-10 01:12:49', 1283);
INSERT INTO `sys_record` VALUES (4626, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:12:50', 27);
INSERT INTO `sys_record` VALUES (4627, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:13:40', 3070);
INSERT INTO `sys_record` VALUES (4628, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:14:23', 10789);
INSERT INTO `sys_record` VALUES (4629, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:15:10', 3469);
INSERT INTO `sys_record` VALUES (4630, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 01:15:10', 26);
INSERT INTO `sys_record` VALUES (4631, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 01:15:26', 9);
INSERT INTO `sys_record` VALUES (4632, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:15:32', 2845);
INSERT INTO `sys_record` VALUES (4633, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 23:50:17', 121);
INSERT INTO `sys_record` VALUES (4634, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-10 23:50:19', 2042);
INSERT INTO `sys_record` VALUES (4635, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 23:50:23', 77);
INSERT INTO `sys_record` VALUES (4636, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:50:38', 26);
INSERT INTO `sys_record` VALUES (4637, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 23:50:53', 3);
INSERT INTO `sys_record` VALUES (4638, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:50:53', 11);
INSERT INTO `sys_record` VALUES (4639, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:51:26', 3);
INSERT INTO `sys_record` VALUES (4640, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:51:10', 4);
INSERT INTO `sys_record` VALUES (4641, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:51:14', 3);
INSERT INTO `sys_record` VALUES (4642, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:52:15', 4);
INSERT INTO `sys_record` VALUES (4643, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 00:54:41', 2);
INSERT INTO `sys_record` VALUES (4644, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:54:41', 5);
INSERT INTO `sys_record` VALUES (4645, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:06:35', 1);
INSERT INTO `sys_record` VALUES (4646, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:35', 5);
INSERT INTO `sys_record` VALUES (4647, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:37', 4);
INSERT INTO `sys_record` VALUES (4648, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:38', 4);
INSERT INTO `sys_record` VALUES (4649, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:38', 5);
INSERT INTO `sys_record` VALUES (4650, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:40', 4);
INSERT INTO `sys_record` VALUES (4651, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:41', 4);
INSERT INTO `sys_record` VALUES (4652, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:11:54', 3);
INSERT INTO `sys_record` VALUES (4653, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:11:54', 5);
INSERT INTO `sys_record` VALUES (4654, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:21:33', 15);
INSERT INTO `sys_record` VALUES (4655, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 01:21:36', 6);
INSERT INTO `sys_record` VALUES (4656, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:21:38', 15);
INSERT INTO `sys_record` VALUES (4657, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:21:54', 4);
INSERT INTO `sys_record` VALUES (4658, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:23:57', 9);
INSERT INTO `sys_record` VALUES (4659, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:23:57', 3);
INSERT INTO `sys_record` VALUES (4660, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 01:24:52', 12);
INSERT INTO `sys_record` VALUES (4661, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:25:20', 26475);
INSERT INTO `sys_record` VALUES (4662, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:27:19', 20629);
INSERT INTO `sys_record` VALUES (4663, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:27:53', 2);
INSERT INTO `sys_record` VALUES (4664, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:29:42', 50);
INSERT INTO `sys_record` VALUES (4665, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:29:42', 15);
INSERT INTO `sys_record` VALUES (4666, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:29:51', 4);
INSERT INTO `sys_record` VALUES (4667, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:29:59', 3);
INSERT INTO `sys_record` VALUES (4668, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:29:59', 8);
INSERT INTO `sys_record` VALUES (4669, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:30:01', 3);
INSERT INTO `sys_record` VALUES (4670, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:30:10', 2);
INSERT INTO `sys_record` VALUES (4671, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:30:56', 6);
INSERT INTO `sys_record` VALUES (4672, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:31:06', 4);
INSERT INTO `sys_record` VALUES (4673, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:31:24', 5);
INSERT INTO `sys_record` VALUES (4674, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:33:24', 2);
INSERT INTO `sys_record` VALUES (4675, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:33:24', 8);
INSERT INTO `sys_record` VALUES (4676, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:33:57', 4);
INSERT INTO `sys_record` VALUES (4677, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:03', 3);
INSERT INTO `sys_record` VALUES (4678, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:20', 4);
INSERT INTO `sys_record` VALUES (4679, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:24', 4);
INSERT INTO `sys_record` VALUES (4680, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:25', 3);
INSERT INTO `sys_record` VALUES (4681, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:36', 2);
INSERT INTO `sys_record` VALUES (4682, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:37', 3);
INSERT INTO `sys_record` VALUES (4683, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:39', 3);
INSERT INTO `sys_record` VALUES (4684, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:41', 3);
INSERT INTO `sys_record` VALUES (4685, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:37:25', 3770);
INSERT INTO `sys_record` VALUES (4686, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:37:36', 11);
INSERT INTO `sys_record` VALUES (4687, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:37:36', 20);
INSERT INTO `sys_record` VALUES (4688, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:38:00', 10589);
INSERT INTO `sys_record` VALUES (4689, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:39:02', 6874);
INSERT INTO `sys_record` VALUES (4690, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:39:14', 4906);
INSERT INTO `sys_record` VALUES (4691, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:40:13', 50516);
INSERT INTO `sys_record` VALUES (4692, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 11:44:26', 112);
INSERT INTO `sys_record` VALUES (4693, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 11:44:28', 2005);
INSERT INTO `sys_record` VALUES (4694, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:26', 76);
INSERT INTO `sys_record` VALUES (4695, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:37', 9);
INSERT INTO `sys_record` VALUES (4696, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:39', 5);
INSERT INTO `sys_record` VALUES (4697, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 12:46:10', 4896);
INSERT INTO `sys_record` VALUES (4698, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 12:46:57', 6);
INSERT INTO `sys_record` VALUES (4699, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 12:48:02', 3);
INSERT INTO `sys_record` VALUES (4700, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 12:48:02', 10922);
INSERT INTO `sys_record` VALUES (4701, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:28:42', 15);
INSERT INTO `sys_record` VALUES (4702, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:28:42', 23);
INSERT INTO `sys_record` VALUES (4703, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:02', 6);
INSERT INTO `sys_record` VALUES (4704, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:31:18', 129);
INSERT INTO `sys_record` VALUES (4705, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:31:24', 2);
INSERT INTO `sys_record` VALUES (4706, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:24', 4);
INSERT INTO `sys_record` VALUES (4707, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:31:32', 126);
INSERT INTO `sys_record` VALUES (4708, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:31:37', 3);
INSERT INTO `sys_record` VALUES (4709, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:37', 6);
INSERT INTO `sys_record` VALUES (4710, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:53', 5);
INSERT INTO `sys_record` VALUES (4711, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:05', 5);
INSERT INTO `sys_record` VALUES (4712, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:32:06', 2);
INSERT INTO `sys_record` VALUES (4713, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:06', 5);
INSERT INTO `sys_record` VALUES (4714, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:11', 5);
INSERT INTO `sys_record` VALUES (4715, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:16', 4);
INSERT INTO `sys_record` VALUES (4716, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:18', 3);
INSERT INTO `sys_record` VALUES (4717, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:32:29', 68);
INSERT INTO `sys_record` VALUES (4718, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:29', 5);
INSERT INTO `sys_record` VALUES (4719, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 13:32:37', 21);
INSERT INTO `sys_record` VALUES (4720, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 13:56:16', 13);
INSERT INTO `sys_record` VALUES (4721, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:56:16', 10);
INSERT INTO `sys_record` VALUES (4722, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 13:56:27', 10);
INSERT INTO `sys_record` VALUES (4723, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:28', 19);
INSERT INTO `sys_record` VALUES (4724, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:33', 7);
INSERT INTO `sys_record` VALUES (4725, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:56:51', 128);
INSERT INTO `sys_record` VALUES (4726, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:51', 3);
INSERT INTO `sys_record` VALUES (4727, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:04:46', 7);
INSERT INTO `sys_record` VALUES (4728, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:05:19', 2);
INSERT INTO `sys_record` VALUES (4729, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:05:19', 5);
INSERT INTO `sys_record` VALUES (4730, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:05:54', 3);
INSERT INTO `sys_record` VALUES (4731, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:05:54', 5);
INSERT INTO `sys_record` VALUES (4732, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:07:05', 2);
INSERT INTO `sys_record` VALUES (4733, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:07:05', 5);
INSERT INTO `sys_record` VALUES (4734, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:17:33', 5);
INSERT INTO `sys_record` VALUES (4735, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:17:33', 1);
INSERT INTO `sys_record` VALUES (4736, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:42:11', 1);
INSERT INTO `sys_record` VALUES (4737, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:42:11', 3);
INSERT INTO `sys_record` VALUES (4738, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:43:03', 2);
INSERT INTO `sys_record` VALUES (4739, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:43:08', 1282);
INSERT INTO `sys_record` VALUES (4740, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:43:18', 1);
INSERT INTO `sys_record` VALUES (4741, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:43:19', 1233);
INSERT INTO `sys_record` VALUES (4742, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:03', 4);
INSERT INTO `sys_record` VALUES (4743, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:05', 3);
INSERT INTO `sys_record` VALUES (4744, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:08', 2);
INSERT INTO `sys_record` VALUES (4745, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:45:27', 1);
INSERT INTO `sys_record` VALUES (4746, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:27', 4);
INSERT INTO `sys_record` VALUES (4747, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:45:36', 1175);
INSERT INTO `sys_record` VALUES (4748, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:45:40', 4);
INSERT INTO `sys_record` VALUES (4749, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:03', 14);
INSERT INTO `sys_record` VALUES (4750, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:04', 57);
INSERT INTO `sys_record` VALUES (4751, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:04', 4);
INSERT INTO `sys_record` VALUES (4752, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:06', 55);
INSERT INTO `sys_record` VALUES (4753, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:06', 2);
INSERT INTO `sys_record` VALUES (4754, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:07', 99);
INSERT INTO `sys_record` VALUES (4755, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:07', 3);
INSERT INTO `sys_record` VALUES (4756, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:09', 45);
INSERT INTO `sys_record` VALUES (4757, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:09', 3);
INSERT INTO `sys_record` VALUES (4758, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:11', 3);
INSERT INTO `sys_record` VALUES (4759, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:48:19', 4);
INSERT INTO `sys_record` VALUES (4760, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:24', 5);
INSERT INTO `sys_record` VALUES (4761, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:26', 4);
INSERT INTO `sys_record` VALUES (4762, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:27', 2);
INSERT INTO `sys_record` VALUES (4763, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:30', 2);
INSERT INTO `sys_record` VALUES (4764, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:35', 54);
INSERT INTO `sys_record` VALUES (4765, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:35', 3);
INSERT INTO `sys_record` VALUES (4766, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:48:42', 2);
INSERT INTO `sys_record` VALUES (4767, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:43', 2);
INSERT INTO `sys_record` VALUES (4768, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:52:58', 16);
INSERT INTO `sys_record` VALUES (4769, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:52:58', 47);
INSERT INTO `sys_record` VALUES (4770, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:05', 53);
INSERT INTO `sys_record` VALUES (4771, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:05', 4);
INSERT INTO `sys_record` VALUES (4772, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:53:13', 2);
INSERT INTO `sys_record` VALUES (4773, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:13', 4);
INSERT INTO `sys_record` VALUES (4774, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:29', 140);
INSERT INTO `sys_record` VALUES (4775, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:29', 7);
INSERT INTO `sys_record` VALUES (4776, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:34', 42);
INSERT INTO `sys_record` VALUES (4777, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:34', 3);
INSERT INTO `sys_record` VALUES (4778, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:39', 2);
INSERT INTO `sys_record` VALUES (4779, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:47', 145);
INSERT INTO `sys_record` VALUES (4780, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:47', 3);
INSERT INTO `sys_record` VALUES (4781, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:50', 2);
INSERT INTO `sys_record` VALUES (4782, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:54:01', 4);
INSERT INTO `sys_record` VALUES (4783, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:55:37', 3);
INSERT INTO `sys_record` VALUES (4784, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:56:04', 4);
INSERT INTO `sys_record` VALUES (4785, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:57:41', 3);
INSERT INTO `sys_record` VALUES (4786, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:57:59', 68);
INSERT INTO `sys_record` VALUES (4787, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:57:59', 3);
INSERT INTO `sys_record` VALUES (4788, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:04', 3);
INSERT INTO `sys_record` VALUES (4789, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:22', 6);
INSERT INTO `sys_record` VALUES (4790, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:31', 5);
INSERT INTO `sys_record` VALUES (4791, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:59:57', 4);
INSERT INTO `sys_record` VALUES (4792, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 15:01:11', 5);
INSERT INTO `sys_record` VALUES (4793, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:01:22', 4);
INSERT INTO `sys_record` VALUES (4794, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:03:00', 6);
INSERT INTO `sys_record` VALUES (4795, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 15:03:01', 1161);
INSERT INTO `sys_record` VALUES (4796, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:20', 8);
INSERT INTO `sys_record` VALUES (4797, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:03:39', 3);
INSERT INTO `sys_record` VALUES (4798, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:44', 5);
INSERT INTO `sys_record` VALUES (4799, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:48', 6);
INSERT INTO `sys_record` VALUES (4800, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:05:12', 19);
INSERT INTO `sys_record` VALUES (4801, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:13', 4);
INSERT INTO `sys_record` VALUES (4802, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 0);
INSERT INTO `sys_record` VALUES (4803, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 71);
INSERT INTO `sys_record` VALUES (4804, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 5);
INSERT INTO `sys_record` VALUES (4805, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-11 15:05:40', 2);
INSERT INTO `sys_record` VALUES (4806, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:05:43', 1);
INSERT INTO `sys_record` VALUES (4807, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:48', 0);
INSERT INTO `sys_record` VALUES (4808, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:06:19', 0);
INSERT INTO `sys_record` VALUES (4809, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:06:26', 16789);
INSERT INTO `sys_record` VALUES (4810, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:06:26', 4);
INSERT INTO `sys_record` VALUES (4811, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:07:15', 1);
INSERT INTO `sys_record` VALUES (4812, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:07:15', 5);
INSERT INTO `sys_record` VALUES (4813, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:07:31', 2);
INSERT INTO `sys_record` VALUES (4814, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:07:33', 0);
INSERT INTO `sys_record` VALUES (4815, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 0);
INSERT INTO `sys_record` VALUES (4816, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 15930);
INSERT INTO `sys_record` VALUES (4817, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 4);
INSERT INTO `sys_record` VALUES (4818, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:08:10', 1);
INSERT INTO `sys_record` VALUES (4819, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:08:10', 6);
INSERT INTO `sys_record` VALUES (4820, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:08:43', 1);
INSERT INTO `sys_record` VALUES (4821, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:08:45', 0);
INSERT INTO `sys_record` VALUES (4822, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 0);
INSERT INTO `sys_record` VALUES (4823, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 7215);
INSERT INTO `sys_record` VALUES (4824, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 4);
INSERT INTO `sys_record` VALUES (4825, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:10:45', 1);
INSERT INTO `sys_record` VALUES (4826, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:45', 5);
INSERT INTO `sys_record` VALUES (4827, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:46', 1);
INSERT INTO `sys_record` VALUES (4828, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:48', 0);
INSERT INTO `sys_record` VALUES (4829, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:50', 0);
INSERT INTO `sys_record` VALUES (4830, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:10:51', 50);
INSERT INTO `sys_record` VALUES (4831, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:51', 3);
INSERT INTO `sys_record` VALUES (4832, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:53', 2);
INSERT INTO `sys_record` VALUES (4833, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:54', 0);
INSERT INTO `sys_record` VALUES (4834, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:54', 2);
INSERT INTO `sys_record` VALUES (4835, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:56', 0);
INSERT INTO `sys_record` VALUES (4836, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:57', 0);
INSERT INTO `sys_record` VALUES (4837, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 0);
INSERT INTO `sys_record` VALUES (4838, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 63);
INSERT INTO `sys_record` VALUES (4839, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 4);
INSERT INTO `sys_record` VALUES (4840, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 15:11:51', 6);
INSERT INTO `sys_record` VALUES (4841, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 14:16:15', 102);
INSERT INTO `sys_record` VALUES (4842, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-12 14:16:17', 2047);
INSERT INTO `sys_record` VALUES (4843, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-12 14:19:35', 1193);
INSERT INTO `sys_record` VALUES (4844, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-12 14:21:21', 64);
INSERT INTO `sys_record` VALUES (4845, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 17:39:39', 23);
INSERT INTO `sys_record` VALUES (4846, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-12 17:39:41', 15);
INSERT INTO `sys_record` VALUES (4847, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 17:39:45', 2);
INSERT INTO `sys_record` VALUES (4848, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-12 17:39:45', 12);
INSERT INTO `sys_record` VALUES (4849, '根据id查询钥匙', '/api/okr/key/queryById', 'admin', '127.0.0.1', '2021-12-12 17:39:51', 18);
INSERT INTO `sys_record` VALUES (4850, '模糊查询钥匙', '/api/okr/enum/key', 'admin', '127.0.0.1', '2021-12-12 17:39:52', 2);
INSERT INTO `sys_record` VALUES (4851, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 17:39:54', 8);
INSERT INTO `sys_record` VALUES (4852, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-12 17:39:55', 2);
INSERT INTO `sys_record` VALUES (4853, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:42:24', 3);
INSERT INTO `sys_record` VALUES (4854, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:42:24', 8);
INSERT INTO `sys_record` VALUES (4855, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:42:41', 3);
INSERT INTO `sys_record` VALUES (4856, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:42:41', 8);
INSERT INTO `sys_record` VALUES (4857, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:43:28', 2);
INSERT INTO `sys_record` VALUES (4858, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:43:28', 10);
INSERT INTO `sys_record` VALUES (4859, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 20:30:03', 2);
INSERT INTO `sys_record` VALUES (4860, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 20:30:03', 8);
INSERT INTO `sys_record` VALUES (4861, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:03', 213);
INSERT INTO `sys_record` VALUES (4862, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:40', 16);
INSERT INTO `sys_record` VALUES (4863, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:49', 3);
INSERT INTO `sys_record` VALUES (4864, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:59:31', 3);
INSERT INTO `sys_record` VALUES (4865, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:59:38', 2);
INSERT INTO `sys_record` VALUES (4866, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:03:18', 22);
INSERT INTO `sys_record` VALUES (4867, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:10', 13);
INSERT INTO `sys_record` VALUES (4868, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:15', 6);
INSERT INTO `sys_record` VALUES (4869, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:39', 6);
INSERT INTO `sys_record` VALUES (4870, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:43', 8);
INSERT INTO `sys_record` VALUES (4871, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:04:43', 13);
INSERT INTO `sys_record` VALUES (4872, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:01', 6);
INSERT INTO `sys_record` VALUES (4873, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:13', 5);
INSERT INTO `sys_record` VALUES (4874, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:16', 6);
INSERT INTO `sys_record` VALUES (4875, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:34', 7);
INSERT INTO `sys_record` VALUES (4876, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:15:25', 29);
INSERT INTO `sys_record` VALUES (4877, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:15:27', 11);
INSERT INTO `sys_record` VALUES (4878, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:06', 6);
INSERT INTO `sys_record` VALUES (4879, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:35', 7);
INSERT INTO `sys_record` VALUES (4880, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:37', 4);
INSERT INTO `sys_record` VALUES (4881, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:44', 6);
INSERT INTO `sys_record` VALUES (4882, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:17:17', 7);
INSERT INTO `sys_record` VALUES (4883, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:17:19', 4);
INSERT INTO `sys_record` VALUES (4884, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:20:43', 8);
INSERT INTO `sys_record` VALUES (4885, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:20:43', 14);
INSERT INTO `sys_record` VALUES (4886, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:21:49', 5);
INSERT INTO `sys_record` VALUES (4887, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 21:22:31', 416);
INSERT INTO `sys_record` VALUES (4888, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:23:41', 4);
INSERT INTO `sys_record` VALUES (4889, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:23:53', 4);
INSERT INTO `sys_record` VALUES (4890, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:23:56', 2);
INSERT INTO `sys_record` VALUES (4891, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:24:36', 3);
INSERT INTO `sys_record` VALUES (4892, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:24:36', 6);
INSERT INTO `sys_record` VALUES (4893, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:24:43', 1);
INSERT INTO `sys_record` VALUES (4894, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:00', 2);
INSERT INTO `sys_record` VALUES (4895, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:00', 2);
INSERT INTO `sys_record` VALUES (4896, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:30:02', 3);
INSERT INTO `sys_record` VALUES (4897, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:03', 2);
INSERT INTO `sys_record` VALUES (4898, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:04', 0);
INSERT INTO `sys_record` VALUES (4899, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:30:43', 4);
INSERT INTO `sys_record` VALUES (4900, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:44', 1);
INSERT INTO `sys_record` VALUES (4901, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:44', 0);
INSERT INTO `sys_record` VALUES (4902, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:49', 2);
INSERT INTO `sys_record` VALUES (4903, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:32:08', 4);
INSERT INTO `sys_record` VALUES (4904, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:32:09', 1);
INSERT INTO `sys_record` VALUES (4905, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:32:10', 0);
INSERT INTO `sys_record` VALUES (4906, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:37:09', 1);
INSERT INTO `sys_record` VALUES (4907, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:37:31', 0);
INSERT INTO `sys_record` VALUES (4908, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:37:34', 0);
INSERT INTO `sys_record` VALUES (4909, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:28', 2);
INSERT INTO `sys_record` VALUES (4910, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:29', 0);
INSERT INTO `sys_record` VALUES (4911, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:29', 1);
INSERT INTO `sys_record` VALUES (4912, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:38:31', 4);
INSERT INTO `sys_record` VALUES (4913, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:32', 1);
INSERT INTO `sys_record` VALUES (4914, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:33', 0);
INSERT INTO `sys_record` VALUES (4915, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:34', 0);
INSERT INTO `sys_record` VALUES (4916, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:35', 0);
INSERT INTO `sys_record` VALUES (4917, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:38:40', 1);
INSERT INTO `sys_record` VALUES (4918, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:41:10', 18);
INSERT INTO `sys_record` VALUES (4919, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:41:11', 4);
INSERT INTO `sys_record` VALUES (4920, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:51:40', 21);
INSERT INTO `sys_record` VALUES (4921, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:51:44', 1);
INSERT INTO `sys_record` VALUES (4922, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:55:38', 25);
INSERT INTO `sys_record` VALUES (4923, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:55:40', 3);
INSERT INTO `sys_record` VALUES (4924, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:55:41', 0);
INSERT INTO `sys_record` VALUES (4925, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:56:05', 18133);
INSERT INTO `sys_record` VALUES (4926, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:57:47', 62);
INSERT INTO `sys_record` VALUES (4927, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:01:25', 23);
INSERT INTO `sys_record` VALUES (4928, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:01:35', 4);
INSERT INTO `sys_record` VALUES (4929, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:35', 11);
INSERT INTO `sys_record` VALUES (4930, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:01:40', 137);
INSERT INTO `sys_record` VALUES (4931, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:01:40', 9);
INSERT INTO `sys_record` VALUES (4932, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:01:51', 3);
INSERT INTO `sys_record` VALUES (4933, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:52', 0);
INSERT INTO `sys_record` VALUES (4934, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:53', 0);
INSERT INTO `sys_record` VALUES (4935, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:54', 0);
INSERT INTO `sys_record` VALUES (4936, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:02:04', 44);
INSERT INTO `sys_record` VALUES (4937, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:02:04', 5);
INSERT INTO `sys_record` VALUES (4938, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:02:05', 1);
INSERT INTO `sys_record` VALUES (4939, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:06', 0);
INSERT INTO `sys_record` VALUES (4940, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:07', 0);
INSERT INTO `sys_record` VALUES (4941, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:10', 0);
INSERT INTO `sys_record` VALUES (4942, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:11', 0);
INSERT INTO `sys_record` VALUES (4943, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:12', 0);
INSERT INTO `sys_record` VALUES (4944, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:02:21', 100);
INSERT INTO `sys_record` VALUES (4945, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:02:21', 6);
INSERT INTO `sys_record` VALUES (4946, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 22:02:58', 174);
INSERT INTO `sys_record` VALUES (4947, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:09:27', 20);
INSERT INTO `sys_record` VALUES (4948, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:09:31', 12);
INSERT INTO `sys_record` VALUES (4949, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:10:20', 7);
INSERT INTO `sys_record` VALUES (4950, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 23:10:20', 15);
INSERT INTO `sys_record` VALUES (4951, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:11:04', 7);
INSERT INTO `sys_record` VALUES (4952, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:11:05', 9);
INSERT INTO `sys_record` VALUES (4953, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:11:07', 9);
INSERT INTO `sys_record` VALUES (4954, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:12:03', 28108);
INSERT INTO `sys_record` VALUES (4955, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:12:14', 7449);
INSERT INTO `sys_record` VALUES (4956, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 23:13:38', 1);
INSERT INTO `sys_record` VALUES (4957, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:13:38', 6);
INSERT INTO `sys_record` VALUES (4958, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:13:41', 5);
INSERT INTO `sys_record` VALUES (4959, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:11:34', 27);
INSERT INTO `sys_record` VALUES (4960, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-13 00:11:41', 8);
INSERT INTO `sys_record` VALUES (4961, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:12:31', 10);
INSERT INTO `sys_record` VALUES (4962, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:12:34', 1695);
INSERT INTO `sys_record` VALUES (4963, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:13:16', 32184);
INSERT INTO `sys_record` VALUES (4964, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:14:28', 14);
INSERT INTO `sys_record` VALUES (4965, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:14:29', 1211);
INSERT INTO `sys_record` VALUES (4966, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:14:30', 4);
INSERT INTO `sys_record` VALUES (4967, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:14:35', 2944);
INSERT INTO `sys_record` VALUES (4968, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:15:56', 4);
INSERT INTO `sys_record` VALUES (4969, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:16:19', 1);
INSERT INTO `sys_record` VALUES (4970, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:16:20', 1166);
INSERT INTO `sys_record` VALUES (4971, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:16:23', 5);
INSERT INTO `sys_record` VALUES (4972, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:16:24', 6);
INSERT INTO `sys_record` VALUES (4973, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:17:45', 5);
INSERT INTO `sys_record` VALUES (4974, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:18:42', 6);
INSERT INTO `sys_record` VALUES (4975, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:19:44', 3);
INSERT INTO `sys_record` VALUES (4976, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:19:45', 1164);
INSERT INTO `sys_record` VALUES (4977, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:19:57', 5);
INSERT INTO `sys_record` VALUES (4978, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:20:02', 8);
INSERT INTO `sys_record` VALUES (4979, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:24:37', 1);
INSERT INTO `sys_record` VALUES (4980, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:24:37', 6);
INSERT INTO `sys_record` VALUES (4981, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:24:39', 6);
INSERT INTO `sys_record` VALUES (4982, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:33:50', 24);
INSERT INTO `sys_record` VALUES (4983, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:33:50', 121);
INSERT INTO `sys_record` VALUES (4984, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:34:00', 9);
INSERT INTO `sys_record` VALUES (4985, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:03', 4);
INSERT INTO `sys_record` VALUES (4986, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:35', 4);
INSERT INTO `sys_record` VALUES (4987, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:39', 7);
INSERT INTO `sys_record` VALUES (4988, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:43', 3);
INSERT INTO `sys_record` VALUES (4989, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:50', 3);
INSERT INTO `sys_record` VALUES (4990, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:58', 2);
INSERT INTO `sys_record` VALUES (4991, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:00', 3);
INSERT INTO `sys_record` VALUES (4992, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:05', 4);
INSERT INTO `sys_record` VALUES (4993, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:08', 3);
INSERT INTO `sys_record` VALUES (4994, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:36:20', 1);
INSERT INTO `sys_record` VALUES (4995, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:21', 4);
INSERT INTO `sys_record` VALUES (4996, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:22', 0);
INSERT INTO `sys_record` VALUES (4997, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:24', 0);
INSERT INTO `sys_record` VALUES (4998, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:36:29', 404);
INSERT INTO `sys_record` VALUES (4999, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:29', 3);
INSERT INTO `sys_record` VALUES (5000, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:32', 3);
INSERT INTO `sys_record` VALUES (5001, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:47', 2);
INSERT INTO `sys_record` VALUES (5002, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:00', 2);
INSERT INTO `sys_record` VALUES (5003, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:00', 0);
INSERT INTO `sys_record` VALUES (5004, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:03', 1);
INSERT INTO `sys_record` VALUES (5005, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:05', 0);
INSERT INTO `sys_record` VALUES (5006, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:07', 0);
INSERT INTO `sys_record` VALUES (5007, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:42:15', 33);
INSERT INTO `sys_record` VALUES (5008, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:15', 4);
INSERT INTO `sys_record` VALUES (5009, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:17', 2);
INSERT INTO `sys_record` VALUES (5010, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:23', 2);
INSERT INTO `sys_record` VALUES (5011, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:31', 2);
INSERT INTO `sys_record` VALUES (5012, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:31', 0);
INSERT INTO `sys_record` VALUES (5013, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:33', 0);
INSERT INTO `sys_record` VALUES (5014, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:34', 0);
INSERT INTO `sys_record` VALUES (5015, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:42:40', 133);
INSERT INTO `sys_record` VALUES (5016, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:40', 2);
INSERT INTO `sys_record` VALUES (5017, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:43', 3);
INSERT INTO `sys_record` VALUES (5018, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:43:11', 2);
INSERT INTO `sys_record` VALUES (5019, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:03:49', 13);
INSERT INTO `sys_record` VALUES (5020, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:03:50', 1701);
INSERT INTO `sys_record` VALUES (5021, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-13 01:04:07', 50);
INSERT INTO `sys_record` VALUES (5022, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:04:11', 1187);
INSERT INTO `sys_record` VALUES (5023, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-13 01:06:17', 10);
INSERT INTO `sys_record` VALUES (5024, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 01:06:21', 62);
INSERT INTO `sys_record` VALUES (5025, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:22', 18);
INSERT INTO `sys_record` VALUES (5026, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:26', 4);
INSERT INTO `sys_record` VALUES (5027, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:27', 4);
INSERT INTO `sys_record` VALUES (5028, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:29', 5);
INSERT INTO `sys_record` VALUES (5029, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:32', 32);
INSERT INTO `sys_record` VALUES (5030, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:37', 5);
INSERT INTO `sys_record` VALUES (5031, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:41', 2);
INSERT INTO `sys_record` VALUES (5032, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:44', 5);
INSERT INTO `sys_record` VALUES (5033, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:47', 3);
INSERT INTO `sys_record` VALUES (5034, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:50', 6);
INSERT INTO `sys_record` VALUES (5035, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:52', 3);
INSERT INTO `sys_record` VALUES (5036, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:09:00', 2);
INSERT INTO `sys_record` VALUES (5037, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:09:30', 1183);
INSERT INTO `sys_record` VALUES (5038, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:12:39', 11);
INSERT INTO `sys_record` VALUES (5039, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:12:39', 17);
INSERT INTO `sys_record` VALUES (5040, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:16:04', 1);
INSERT INTO `sys_record` VALUES (5041, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:16:04', 4);
INSERT INTO `sys_record` VALUES (5042, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:17:32', 1);
INSERT INTO `sys_record` VALUES (5043, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:17:32', 6);
INSERT INTO `sys_record` VALUES (5044, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:24:38', 1158);
INSERT INTO `sys_record` VALUES (5045, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:24:40', 4);
INSERT INTO `sys_record` VALUES (5046, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:12:48', 200);
INSERT INTO `sys_record` VALUES (5047, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 11:12:49', 2162);
INSERT INTO `sys_record` VALUES (5048, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 11:16:08', 1176);
INSERT INTO `sys_record` VALUES (5049, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:17:33', 122);
INSERT INTO `sys_record` VALUES (5050, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:23:05', 2);
INSERT INTO `sys_record` VALUES (5051, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:23:05', 10);
INSERT INTO `sys_record` VALUES (5052, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:55:26', 14);
INSERT INTO `sys_record` VALUES (5053, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:55:26', 18);
INSERT INTO `sys_record` VALUES (5054, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:57:28', 3);
INSERT INTO `sys_record` VALUES (5055, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:57:28', 7);
INSERT INTO `sys_record` VALUES (5056, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:57:57', 3);
INSERT INTO `sys_record` VALUES (5057, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:57:57', 9);
INSERT INTO `sys_record` VALUES (5058, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:58:31', 6);
INSERT INTO `sys_record` VALUES (5059, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:58:31', 10);
INSERT INTO `sys_record` VALUES (5060, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:01:38', 24);
INSERT INTO `sys_record` VALUES (5061, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:05:14', 4);
INSERT INTO `sys_record` VALUES (5062, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:11:06', 6);
INSERT INTO `sys_record` VALUES (5063, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:27:43', 7);
INSERT INTO `sys_record` VALUES (5064, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:34:29', 137);
INSERT INTO `sys_record` VALUES (5065, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:34:52', 3);
INSERT INTO `sys_record` VALUES (5066, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:36:03', 3);
INSERT INTO `sys_record` VALUES (5067, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:38:19', 18);
INSERT INTO `sys_record` VALUES (5068, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:46:04', 10);
INSERT INTO `sys_record` VALUES (5069, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:46:40', 6);
INSERT INTO `sys_record` VALUES (5070, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:46:40', 17);
INSERT INTO `sys_record` VALUES (5071, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:50:01', 13);
INSERT INTO `sys_record` VALUES (5072, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:50:02', 42);
INSERT INTO `sys_record` VALUES (5073, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:51:12', 1);
INSERT INTO `sys_record` VALUES (5074, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:51:12', 5);
INSERT INTO `sys_record` VALUES (5075, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:52:32', 5);
INSERT INTO `sys_record` VALUES (5076, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:54:12', 11);
INSERT INTO `sys_record` VALUES (5077, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:56:49', 20);
INSERT INTO `sys_record` VALUES (5078, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:36', 15);
INSERT INTO `sys_record` VALUES (5079, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 12:57:43', 175);
INSERT INTO `sys_record` VALUES (5080, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:43', 4);
INSERT INTO `sys_record` VALUES (5081, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 12:57:55', 393);
INSERT INTO `sys_record` VALUES (5082, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:55', 2);
INSERT INTO `sys_record` VALUES (5083, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:59:26', 14);
INSERT INTO `sys_record` VALUES (5084, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 12:59:28', 1836);
INSERT INTO `sys_record` VALUES (5085, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 12:59:30', 35);
INSERT INTO `sys_record` VALUES (5086, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:09', 10);
INSERT INTO `sys_record` VALUES (5087, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:26', 4);
INSERT INTO `sys_record` VALUES (5088, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:30', 5);
INSERT INTO `sys_record` VALUES (5089, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:36', 4);
INSERT INTO `sys_record` VALUES (5090, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:00:50', 478);
INSERT INTO `sys_record` VALUES (5091, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 1);
INSERT INTO `sys_record` VALUES (5092, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 5);
INSERT INTO `sys_record` VALUES (5093, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 1);
INSERT INTO `sys_record` VALUES (5094, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 5);
INSERT INTO `sys_record` VALUES (5095, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:03:14', 15);
INSERT INTO `sys_record` VALUES (5096, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 9);
INSERT INTO `sys_record` VALUES (5097, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 1);
INSERT INTO `sys_record` VALUES (5098, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 1);
INSERT INTO `sys_record` VALUES (5099, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 8);
INSERT INTO `sys_record` VALUES (5100, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:03:54', 15);
INSERT INTO `sys_record` VALUES (5101, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:04:42', 1);
INSERT INTO `sys_record` VALUES (5102, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:04:42', 4);
INSERT INTO `sys_record` VALUES (5103, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:04:59', 156);
INSERT INTO `sys_record` VALUES (5104, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:04:59', 2);
INSERT INTO `sys_record` VALUES (5105, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:05:08', 50);
INSERT INTO `sys_record` VALUES (5106, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:05:08', 4);
INSERT INTO `sys_record` VALUES (5107, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:05:35', 1);
INSERT INTO `sys_record` VALUES (5108, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:05:35', 4);
INSERT INTO `sys_record` VALUES (5109, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:06:42', 9);
INSERT INTO `sys_record` VALUES (5110, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:06:55', 48);
INSERT INTO `sys_record` VALUES (5111, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:06:55', 5);
INSERT INTO `sys_record` VALUES (5112, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:07:00', 0);
INSERT INTO `sys_record` VALUES (5113, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:07:04', 43);
INSERT INTO `sys_record` VALUES (5114, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:07:04', 3);
INSERT INTO `sys_record` VALUES (5115, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:12:36', 1);
INSERT INTO `sys_record` VALUES (5116, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:12:42', 129);
INSERT INTO `sys_record` VALUES (5117, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:12:42', 2);
INSERT INTO `sys_record` VALUES (5118, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:12:53', 150);
INSERT INTO `sys_record` VALUES (5119, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:12:53', 3);
INSERT INTO `sys_record` VALUES (5120, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:12:56', 1);
INSERT INTO `sys_record` VALUES (5121, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:13:12', 132);
INSERT INTO `sys_record` VALUES (5122, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:13:12', 2);
INSERT INTO `sys_record` VALUES (5123, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:13:58', 3);
INSERT INTO `sys_record` VALUES (5124, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:18:29', 13);
INSERT INTO `sys_record` VALUES (5125, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:18:57', 3);
INSERT INTO `sys_record` VALUES (5126, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:19:00', 164);
INSERT INTO `sys_record` VALUES (5127, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:00', 4);
INSERT INTO `sys_record` VALUES (5128, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:19:02', 48);
INSERT INTO `sys_record` VALUES (5129, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:02', 2);
INSERT INTO `sys_record` VALUES (5130, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:13', 3);
INSERT INTO `sys_record` VALUES (5131, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 126);
INSERT INTO `sys_record` VALUES (5132, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 2);
INSERT INTO `sys_record` VALUES (5133, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 1);
INSERT INTO `sys_record` VALUES (5134, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:32', 60);
INSERT INTO `sys_record` VALUES (5135, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:32', 2);
INSERT INTO `sys_record` VALUES (5136, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:33', 1);
INSERT INTO `sys_record` VALUES (5137, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:38', 55);
INSERT INTO `sys_record` VALUES (5138, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:38', 4);
INSERT INTO `sys_record` VALUES (5139, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:42', 1);
INSERT INTO `sys_record` VALUES (5140, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:48', 172);
INSERT INTO `sys_record` VALUES (5141, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:48', 3);
INSERT INTO `sys_record` VALUES (5142, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:19:55', 42);
INSERT INTO `sys_record` VALUES (5143, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:56', 2);
INSERT INTO `sys_record` VALUES (5144, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:18', 73);
INSERT INTO `sys_record` VALUES (5145, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:18', 2);
INSERT INTO `sys_record` VALUES (5146, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:27', 49);
INSERT INTO `sys_record` VALUES (5147, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:27', 2);
INSERT INTO `sys_record` VALUES (5148, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:44', 43);
INSERT INTO `sys_record` VALUES (5149, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:44', 3);
INSERT INTO `sys_record` VALUES (5150, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:52', 3);
INSERT INTO `sys_record` VALUES (5151, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:14', 3);
INSERT INTO `sys_record` VALUES (5152, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:15', 4);
INSERT INTO `sys_record` VALUES (5153, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:18', 3);
INSERT INTO `sys_record` VALUES (5154, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:25', 2);
INSERT INTO `sys_record` VALUES (5155, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:21:32', 134);
INSERT INTO `sys_record` VALUES (5156, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:32', 3);
INSERT INTO `sys_record` VALUES (5157, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:21:34', 123);
INSERT INTO `sys_record` VALUES (5158, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:34', 1);
INSERT INTO `sys_record` VALUES (5159, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:37', 3);
INSERT INTO `sys_record` VALUES (5160, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:55', 4);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `weight` int(11) NOT NULL COMMENT '排序权重',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (5, 'spring全家桶', 1, 0);
INSERT INTO `tag` VALUES (6, 'java天下第一', 2, 0);
INSERT INTO `tag` VALUES (7, '人生苦短，你用python', 3, 0);
INSERT INTO `tag` VALUES (8, 'c++？c艹', 2, 0);
INSERT INTO `tag` VALUES (9, '大数据技术', 1, 0);
INSERT INTO `tag` VALUES (10, '网络空间安全', 1, 0);
INSERT INTO `tag` VALUES (11, 'php是世界上最好的语言', 5, 0);
INSERT INTO `tag` VALUES (12, '区块链技术', 0, 0);
INSERT INTO `tag` VALUES (13, '数据挖掘', 3, 0);
INSERT INTO `tag` VALUES (14, '前端三剑客', 2, 0);
INSERT INTO `tag` VALUES (15, 'vue框架', 1, 0);
INSERT INTO `tag` VALUES (16, 'linux操作系统', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 940 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `task` VALUES (646, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (647, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (648, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (649, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (650, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (651, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (652, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (653, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (654, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (655, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (656, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (657, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (658, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (659, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (660, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (661, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (662, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (663, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (664, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (665, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (666, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (667, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (668, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (669, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (670, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (671, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (672, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (673, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (674, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (675, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (676, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (677, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (678, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (679, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (680, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (681, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (682, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (683, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (684, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (685, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (686, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (687, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (688, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (689, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (690, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (691, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (692, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (693, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (694, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (695, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (696, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (697, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (698, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (699, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (700, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (701, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (702, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (703, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (704, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (705, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (706, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (707, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (708, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (709, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (710, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (711, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (712, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (713, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (714, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (715, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (716, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (717, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (718, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (719, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (720, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (721, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (722, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (723, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (724, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (725, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (726, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (727, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (728, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (729, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (730, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (731, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (732, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (733, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (734, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (735, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (736, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (737, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (738, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (739, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (740, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (741, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (742, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (743, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (744, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (745, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (746, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (747, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (748, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (749, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (750, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (751, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (752, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (753, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (754, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (755, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (756, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (757, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (758, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (759, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (760, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (761, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (762, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (763, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (764, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (765, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (766, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (767, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (768, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (769, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (770, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (771, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (772, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (773, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (774, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (775, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (776, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (777, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (778, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (779, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (780, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (781, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (782, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (783, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (784, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (785, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (786, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (787, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (788, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (789, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (790, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (791, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (792, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (793, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (794, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (795, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (796, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (797, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (798, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (799, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (800, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (801, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (802, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (803, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (804, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (805, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (806, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (807, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (808, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (809, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (810, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (811, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (812, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (813, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (814, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (815, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (816, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (817, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (818, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (819, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (820, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (821, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (822, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (823, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (824, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (825, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (826, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (827, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (828, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (829, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (830, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (831, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (832, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (833, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (834, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (835, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (836, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (837, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (838, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (839, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (840, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (841, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (842, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (843, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (844, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (845, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (846, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (847, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (848, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (849, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (850, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (851, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (852, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (853, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (854, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (855, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (856, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (857, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (858, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (859, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (860, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (861, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (862, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (863, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (864, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (865, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (866, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (867, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (868, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (869, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (870, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (871, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (872, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (873, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (874, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (875, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (876, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (877, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (878, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (879, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (880, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (881, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (882, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (883, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (884, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (885, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (886, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (887, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (888, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (889, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (890, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (891, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (892, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (893, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (894, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (895, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (896, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (897, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (898, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (899, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (900, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (901, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (902, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (903, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (904, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (905, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (906, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (907, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (908, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (909, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (910, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (911, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (912, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (913, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (914, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (915, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (916, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (917, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (918, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (919, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (920, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (921, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (922, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (923, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (924, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (925, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (926, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (927, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (928, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (929, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (930, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (931, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (932, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (933, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (934, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (935, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (936, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (937, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (938, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (939, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_entity
-- ----------------------------
INSERT INTO `user_entity` VALUES (20, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, 0);
INSERT INTO `user_entity` VALUES (21, 'test1', '5a105e8b9d40e1329780d62ea2265d8a', NULL, NULL, 0);
INSERT INTO `user_entity` VALUES (22, 'fuck', '99754106633f94d350db34d548d6091a', '2021-12-05 15:07:31', '2021-12-05 15:07:31', 0);

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
INSERT INTO `user_info` VALUES (20, 'admin', '你是基佬', 'data:image/png;base64,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', '我是蓝翔', '1234561234', '654312', 'shit12312', '一起搞基，先生！是的，先生sjfijseoaifjiosejfiosejafioughuisdhrgruhgioj', 1, NULL, '2021-12-11 15:10:51', 0);
INSERT INTO `user_info` VALUES (21, 'test1', '大便', 'data:image/png;base64,/9j/4AAQSkZJRgABAQEBLAEsAAD/7SSuUGhvdG9zaG9wIDMuMAA4QklNBCUAAAAAABAAAAAAAAAAAAAAAAAAAAAAOEJJTQQ6AAAAAACTAAAAEAAAAAEAAAAAAAtwcmludE91dHB1dAAAAAUAAAAAQ2xyU2VudW0AAAAAQ2xyUwAAAABSR0JDAAAAAEludGVlbnVtAAAAAEludGUAAAAASW1nIAAAAABNcEJsYm9vbAEAAAAPcHJpbnRTaXh0ZWVuQml0Ym9vbAAAAAALcHJpbnRlck5hbWVURVhUAAAAAQAAADhCSU0EOwAAAAABsgAAABAAAAABAAAAAAAScHJpbnRPdXRwdXRPcHRpb25zAAAAEgAAAABDcHRuYm9vbAAAAAAAQ2xicmJvb2wAAAAAAFJnc01ib29sAAAAAABDcm5DYm9vbAAAAAAAQ250Q2Jvb2wAAAAAAExibHNib29sAAAAAABOZ3R2Ym9vbAAAAAAARW1sRGJvb2wAAAAAAEludHJib29sAAAAAABCY2tnT2JqYwAAAAEAAAAAAABSR0JDAAAAAwAAAABSZCAgZG91YkBv4AAAAAAAAAAAAEdybiBkb3ViQG/gAAAAAAAAAAAAQmwgIGRvdWJAb+AAAAAAAAAAAABCcmRUVW50RiNSbHQAAAAAAAAAAAAAAABCbGQgVW50RiNSbHQAAAAAAAAAAAAAAABSc2x0VW50RiNQeGxAcsAAAAAAAAAAAAp2ZWN0b3JEYXRhYm9vbAEAAAAAUGdQc2VudW0AAAAAUGdQcwAAAABQZ1BDAAAAAExlZnRVbnRGI1JsdAAAAAAAAAAAAAAAAFRvcCBVbnRGI1JsdAAAAAAAAAAAAAAAAFNjbCBVbnRGI1ByY0BZAAAAAAAAOEJJTQPtAAAAAAAQASwAAAABAAIBLAAAAAEAAjhCSU0EJgAAAAAADgAAAAAAAAAAAAA/gAAAOEJJTQQNAAAAAAAEAAAAeDhCSU0EGQAAAAAABAAAAB44QklNA/MAAAAAAAkAAAAAAAAAAAEAOEJJTScQAAAAAAAKAAEAAAAAAAAAAjhCSU0D9QAAAAAASAAvZmYAAQBsZmYABgAAAAAAAQAvZmYAAQChmZoABgAAAAAAAQAyAAAAAQBaAAAABgAAAAAAAQA1AAAAAQAtAAAABgAAAAAAAThCSU0D+AAAAAAAcAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAA4QklNBAgAAAAAABAAAAABAAACQAAAAkAAAAAAOEJJTQQeAAAAAAAEAAAAADhCSU0EGgAAAAADPwAAAAYAAAAAAAAAAAAAAoAAAAKAAAAABWcqVH1UDQAtADIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAoAAAAKAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAEAAAAAAABudWxsAAAAAgAAAAZib3VuZHNPYmpjAAAAAQAAAAAAAFJjdDEAAAAEAAAAAFRvcCBsb25nAAAAAAAAAABMZWZ0bG9uZwAAAAAAAAAAQnRvbWxvbmcAAAKAAAAAAFJnaHRsb25nAAACgAAAAAZzbGljZXNWbExzAAAAAU9iamMAAAABAAAAAAAFc2xpY2UAAAASAAAAB3NsaWNlSURsb25nAAAAAAAAAAdncm91cElEbG9uZwAAAAAAAAAGb3JpZ2luZW51bQAAAAxFU2xpY2VPcmlnaW4AAAANYXV0b0dlbmVyYXRlZAAAAABUeXBlZW51bQAAAApFU2xpY2VUeXBlAAAAAEltZyAAAAAGYm91bmRzT2JqYwAAAAEAAAAAAABSY3QxAAAABAAAAABUb3AgbG9uZwAAAAAAAAAATGVmdGxvbmcAAAAAAAAAAEJ0b21sb25nAAACgAAAAABSZ2h0bG9uZwAAAoAAAAADdXJsVEVYVAAAAAEAAAAAAABudWxsVEVYVAAAAAEAAAAAAABNc2dlVEVYVAAAAAEAAAAAAAZhbHRUYWdURVhUAAAAAQAAAAAADmNlbGxUZXh0SXNIVE1MYm9vbAEAAAAIY2VsbFRleHRURVhUAAAAAQAAAAAACWhvcnpBbGlnbmVudW0AAAAPRVNsaWNlSG9yekFsaWduAAAAB2RlZmF1bHQAAAAJdmVydEFsaWduZW51bQAAAA9FU2xpY2VWZXJ0QWxpZ24AAAAHZGVmYXVsdAAAAAtiZ0NvbG9yVHlwZWVudW0AAAARRVNsaWNlQkdDb2xvclR5cGUA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b3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBXaW5kb3dzIiB4bXA6Q3JlYXRlRGF0ZT0iMjAxOC0wMy0wNFQwMzo1ODoxMyswODowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOC0wMy0wNFQwMzo1ODoxMyswODowMCIgeG1wOk1vZGlmeURhdGU9IjIwMTgtMDMtMDRUMDM6NTg6MTMrMDg6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvanBlZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo1RDdGQkYzNDFEMUZFODExOTEwRThDRDEwQjFDRDIxQyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo1RDdGQkYzNDFEMUZFODExOTEwRThDRDEwQjFDRDIxQyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjVEN0ZCRjM0MUQxRkU4MTE5MTBFOENEMTBCMUNEMjFDIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0ic1JHQiBJRUM2MTk2Ni0yLjEiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjVEN0ZCRjM0MUQxRkU4MTE5MTBFOENEMTBCMUNEMjFDIiBzdEV2dDp3aGVuPSIyMDE4LTAzLTA0VDAzOjU4OjEzKzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiLz4gPC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg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', '阿斯蒂芬撒地方', '撒分色', '瑟夫', '费萨尔费', '你说的附属恶化覅色回复i色回复i规格和', 2, NULL, '2021-12-11 15:10:58', 0);
INSERT INTO `user_info` VALUES (22, 'fuck', '鸡巴', NULL, '金融', '123', '123', '123123', '二费萨尔费是', 0, '2021-12-05 15:07:31', '2021-12-09 22:59:20', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (14, 20, 1, '2100-01-01 00:00:00', 0);
INSERT INTO `user_role` VALUES (15, 21, 3, '2021-12-25 00:00:00', 0);
INSERT INTO `user_role` VALUES (16, 22, 2, '2021-12-18 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
