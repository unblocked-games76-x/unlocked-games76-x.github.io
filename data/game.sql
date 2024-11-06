-- 游戏分类表
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    seo_title TEXT,
    seo_description TEXT,
    canonical_url TEXT,
    favicon_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- 游戏表
CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    title VARCHAR(200) NOT NULL,
    game_url TEXT NOT NULL, -- 游戏页面的URL地址，例如: /1v1lol.html
    favicon_url TEXT,
    description TEXT,
    og_x_image_url TEXT,
    iframe_src TEXT,
    iframe_title TEXT,
    play_count INTEGER DEFAULT 0,
    cover_url TEXT,
    category_id INTEGER REFERENCES categories(id),
    game_corp_name VARCHAR(500), -- 游戏公司名称
    game_type VARCHAR(50) NOT NULL, -- 游戏类型，例如: 新上线，流行
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 标签表
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL,
    url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 游戏标签关联表
CREATE TABLE game_tags (
    game_id INTEGER REFERENCES games(id),
    tag_id INTEGER REFERENCES tags(id),
    PRIMARY KEY (game_id, tag_id)
);
-- 创建索引
CREATE INDEX idx_games_category_id ON games(category_id);
CREATE INDEX idx_game_tags_game_id ON game_tags(game_id);
CREATE INDEX idx_game_tags_tag_id ON game_tags(tag_id);