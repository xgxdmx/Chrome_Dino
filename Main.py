# coding=utf-8
import sys
import math
import time
import random
import pygame
from pygame.locals import *
from Scene import Scene
from Obstacle import Plant, Ptera
from Dinosaur import Dinosaur


# 定义常量
Background_Colour = (250, 250, 250)
Width = 800
Height = 400
Grade = 100
Probability_2 = 0

# 显示GameOver界面
def Show_GameOver(screen, score_text, time_image):
    screen.fill(Background_Colour)
    GameOver_img = pygame.image.load('./images/modules/gameover.png').convert_alpha()
    GameOver_rect = GameOver_img.get_rect()
    GameOver_rect.left, GameOver_rect.top = Width // 3, int(Height / 3.4)
    screen.blit(GameOver_img, GameOver_rect)
    Restart_img = pygame.image.load("./images/modules/restart.png").convert_alpha()
    Restart_rect = Restart_img.get_rect()
    Restart_rect.left, Restart_rect.top = int(Width / 2.25), int(Height / 2.3)
    Difficult_Up_img = pygame.image.load("./images/modules/难度增加.png").convert_alpha()
    DifficultUp_rect = Difficult_Up_img.get_rect()
    DifficultUp_rect.left, DifficultUp_rect.top = int(550), int(300)
    Difficult_Down_img = pygame.image.load("./images/modules/难度降低.png").convert_alpha()
    DifficultDown_rect = Difficult_Down_img.get_rect()
    DifficultDown_rect.left, DifficultDown_rect.top = int(50), int(300)
    ChangeDino_img = pygame.image.load("./images/modules/更换角色.png").convert_alpha()
    ChangeDino_rect = ChangeDino_img.get_rect()
    ChangeDino_rect.left, ChangeDino_rect.top = int(310), int(300)
    screen.blit(ChangeDino_img, ChangeDino_rect)
    screen.blit(Restart_img, Restart_rect)
    screen.blit(score_text, [250, 250])  # 输出分数
    screen.blit(time_image, [430, 250])
    screen.blit(Difficult_Up_img, DifficultUp_rect)
    screen.blit(Difficult_Down_img, DifficultDown_rect)
    pygame.display.update()
    while True:
        global Grade
        global speedChange
        for event in pygame.event.get():
            if event.type == QUIT:
                sys.exit()
                pygame.quit()
            if event.type == pygame.MOUSEBUTTONDOWN:
                mouse_pos = pygame.mouse.get_pos()
                if Restart_rect.right > mouse_pos[0] > Restart_rect.left and mouse_pos[
                    1] < Restart_rect.bottom and mouse_pos[1] > Restart_rect.top:
                    return True
                if DifficultUp_rect.right > mouse_pos[0] > DifficultUp_rect.left and mouse_pos[
                    1] < DifficultUp_rect.bottom and mouse_pos[1] > DifficultUp_rect.top:
                    Grade = Grade - 10

                    score = 0
                    Obstache_Probability(score, Grade)
                    return True
                if DifficultDown_rect.right > mouse_pos[0] > DifficultDown_rect.left and mouse_pos[
                    1] < DifficultDown_rect.bottom and mouse_pos[1] > DifficultDown_rect.top:
                    Grade = Grade + 10

                    score = 0
                    Obstache_Probability(score, Grade)
                    return True
                if ChangeDino_rect.right > mouse_pos[0] > ChangeDino_rect.left and mouse_pos[
                    1] < ChangeDino_rect.bottom and mouse_pos[1] > ChangeDino_rect.top:
                    return True


# 将Score转换为障碍物生成概率
def Obstache_Probability(score, Grade):
    global Probability_2
    Probability = 1 / (Grade + math.exp(-score))
    Probability_2 = round(Probability,2) * 100
    # print(Grade)
    # print("speed:  " + speed)
    return min(Probability, 1)


# 主函数 main
def main():
    # 游戏程序初始化
    pygame.init()
    screen = pygame.display.set_mode((Width, Height))
    pygame.display.set_caption("梦の彼方")
    Clock = pygame.time.Clock()
    # 得分初始化
    score = 0
    total_time = 0
    taken_time = 0
    # 载入游戏素材并初始化
    Jump_Sound = pygame.mixer.Sound("./music/jump.wav")
    Jump_Sound.set_volume(10)
    Die_Sound = pygame.mixer.Sound("./music/die.wav")
    Die_Sound.set_volume(10)
    pygame.mixer.init()
    pygame.mixer.music.load("./music/bg_music.mp3")
    pygame.mixer.music.set_volume(5)
    pygame.mixer.music.play(-1)
    font = pygame.font.Font("./fonts/FZSJ-TXJW.TTF", 30)
    # 实例化
    dinosaur = Dinosaur(Width, Height)
    scene = Scene(Width, Height)
    plants = pygame.sprite.Group()
    pteras = pygame.sprite.Group()
    # 产生障碍物事件
    GenPlantEvent = pygame.constants.USEREVENT + 0
    pygame.time.set_timer(GenPlantEvent, 2300)
    GenPteraEvent = pygame.constants.USEREVENT + 1
    pygame.time.set_timer(GenPteraEvent, 5000)
    # 判断游戏是否结束
    Running = True
    # 判断是否可以产生障碍物
    Flag_Plant = False
    Flag_Ptera = False
    time0 = time.time()
    # 主循环
    while Running:
        # 计时
        total_time = 0  # 分钟
        taken_time = pygame.time.get_ticks()  # 获取时间
        left_time = total_time * 60000 + taken_time  # 毫秒
        time_min = left_time // 60000
        time_sec = left_time % 60000 // 1000
        time_text = str(time_min).zfill(2) + ':' + str(time_sec).zfill(2)
        time_font = pygame.font.Font("./fonts/FZSJ-TXJW.TTF", 30)
        time_image = time_font.render(time_text, True, (0, 0, 0))
        screen.blit(time_image, [600, 10])
        # 显示得分
        score_text = font.render("Score：" + str(score), 1, (0, 0, 0))
        screen.blit(score_text, [20, 10])
        Probability_text = font.render("障碍物概率：" + str(Probability_2), 1, (0,0,0))
        screen.blit(Probability_text, [200, 10])

        pygame.display.flip()
        Clock.tick(60)
        for event in pygame.event.get():
            if event.type == QUIT:
                sys.exit()
                pygame.quit()
            if event.type == GenPlantEvent:
                Flag_Plant = True
            if event.type == GenPteraEvent:
                if score > 10:
                    Flag_Ptera = True
        # 实现恐龙跳跃
        key_pressed = pygame.key.get_pressed()
        if key_pressed[pygame.K_SPACE]:
            dinosaur.is_jumping = True
            Jump_Sound.play()
        screen.fill(Background_Colour)
        Time_Passed = time.time() - time0
        time0 = time.time()
        # 场景
        scene.move()
        scene.draw(screen)
        # 小恐龙
        dinosaur.is_running = True
        if dinosaur.is_jumping:
            dinosaur.be_afraid()
            dinosaur.jump(Time_Passed)
        dinosaur.draw(screen)
        # 障碍物——植物
        if random.random() < Obstache_Probability(score, Grade) and Flag_Plant:
            plant = Plant(Width, Height)
            plants.add(plant)
            Flag_Plant = False
        for plant in plants:
            plant.move()
            if dinosaur.rect.left > plant.rect.right and not plant.added_score:
                score += 1
                plant.added_score = True
            if plant.rect.right < 0:
                plants.remove(plant)
                continue
            plant.draw(screen)
        # 障碍物——翼龙
        if random.random() < Obstache_Probability(score, Grade) and Flag_Ptera:
            if len(pteras) > 5:
                continue
            ptera = Ptera(Width, Height)
            pteras.add(ptera)
            Flag_Ptera = False
        for ptera in pteras:
            ptera.move()
            if dinosaur.rect.left > ptera.rect.right and not ptera.added_score:
                score += 5
                ptera.added_score = True
            if ptera.rect.right < 0:
                pteras.remove(ptera)
                continue
            ptera.draw(screen)
            Flag_Plant = False

        # 碰撞检测
        if pygame.sprite.spritecollide(dinosaur, plants, False) or pygame.sprite.spritecollide(dinosaur, pteras, False):
            Die_Sound.play()
            Running = False
    res = Show_GameOver(screen, score_text, time_image)
    return res


if __name__ == '__main__':
    res = True
    while res:
        res = main()
