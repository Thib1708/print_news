## Table of Contents

1. [Purpose](#purpose)
1. [Requirement](#requirement)
2. [Instalation](#instalation)
3. [Customization](#customization)

## PURPOSE:

This project is about displaying the weather and some news about subject you likes and your country each time you launch a terminal.
These informations are shown in a window which had to be close tapping 'q' key.

#### Example execution

![Example weather](assets/weather.png)
![Example news](assets/news.png)

## REQUIREMENT
This project use an API called NewsAPI, you need to generate a key on their [website](https://newsapi.org), it's fully free you just had to create an account.

## INSTALATION

Type the folowings commands lines in your ```$HOME``` directory:

```
bash -c "$(curl -fsSL https://raw.github.com/Thib1708/print_news/master/install.sh)"
```
Then add your api key in ```~/zshrc``` between the quotes of export API_KEY="".

## CUSTOMIZATION

You can modifie the export's lines in .zshrc :

-CITY : according to your location to get the weather

-SUBJECT : to get articles about a subject you like

-COUNTRY : to get the top headline of your country
([Here](assets/country.txt) are all the availble country)

You can display articales about more than one subject by adding other export SUBJECT[1..n], add this command:
```
curl https://newsapi.org/v2/everything -G \
    -d q=$SUBJECT[1..n] \
    -d sortBy=popularity \
    -d apiKey=$API_KEY> ~/$SUBJECT[1..n]
```
And add the new var to this command :
```
./print_news/print_news ~/$SUBJECT[1..n] ~/$COUNTRY >> ~/todays_news
```

You can also modifie the colors in ~/print_news/include/print_news.h.

A bash script is present to show you all the colors you terminal is addling. Type this command to use it:
```
sh script.sh |& less
```
To get the same terminal's color as i do go into your terminal settings then profiles/color Color Presets at the bottom right and select Solarized dark
