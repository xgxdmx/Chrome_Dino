import random
import pygame


# 植物
class Plant(pygame.sprite.Sprite):
    def __init__(self, Width=640, Height=500):
        pygame.sprite.Sprite.__init__(self)
        self.Width = Width
        self.Height = Height
        # 统计分数
        self.added_score = False
        self.speed = 8
        self.imgs = ["./images/obstacles/plant_big.png", "./images/obstacles/plant_small.png"]
        self.generate_random()

    # 随机生成障碍物——植物
    def generate_random(self):
        idx = random.randint(0, 1)
        temp = pygame.image.load(self.imgs[idx]).convert_alpha()
        if idx == 0:
            self.plant = temp.subsurface((101 * random.randint(0, 2), 0), (101, 101))
        else:
            self.plant = temp.subsurface((68 * random.randint(0, 2), 0), (68, 70))
        self.rect = self.plant.get_rect()
        self.rect.left, self.rect.top = self.Width + 80, int(self.Height / 2)

    # 持续向左移动
    def move(self):
        self.rect.left = self.rect.left - self.speed

    # 将自己画到屏幕上
    def draw(self, screen):
        screen.blit(self.plant, self.rect)


# 翼龙
class Ptera(pygame.sprite.Sprite):
    def __init__(self, Width=640, Height=500):
        pygame.sprite.Sprite.__init__(self)
        self.Width = Width
        self.Height = Height
        # 统计分数
        self.added_score = False
        self.imgs = ["./images/obstacles/ptera.png"]
        self.speed = 5
        self.generate()
        # 飞行特效
        self.flying_count = 0
        self.flying_flag = True

    # 生成翼龙
    def generate(self):
        self.ptera = pygame.image.load(self.imgs[0]).convert_alpha()
        self.ptera_0 = self.ptera.subsurface((0, 0), (92, 81))
        self.ptera_1 = self.ptera.subsurface((92, 0), (92, 81))
        self.rect = self.ptera_0.get_rect()
        self.rect.left, self.rect.top = self.Width + 30, int(self.Height / 20)

    # 持续向左移动
    def move(self):
        self.rect.left = self.rect.left - self.speed

    # 将自己画到屏幕上
    def draw(self, screen):
        self.flying_count += 1
        if self.flying_count % 6 == 0:
            self.flying_flag = not self.flying_flag
        if self.flying_flag:
            screen.blit(self.ptera_0, self.rect)
        else:
            screen.blit(self.ptera_1, self.rect)