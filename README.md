## Table of Contents

1. [Purpose](#purpose)
1. [Requirement](#requirement)
2. [Instalation](#instalation)
3. [Uninstall](#uninstall)
3. [Customization](#customization)
4. [Documentation](#documentation)

## PURPOSE:

This project display the weather and some news about subjects you like and the top headlines of your country each time you launch a terminal.

### Example execution

![Example weather](assets/weather.png)
![Example news](assets/news.png)

## REQUIREMENT
This project use an API called NewsAPI, you need to generate a key on their [website](https://newsapi.org), it's fully free you just had to create an account.

## INSTALATION

Type the folowings commands lines in your ```$HOME``` directory:

```
bash -c "$(curl -fsSL https://raw.github.com/Thib1708/print_news/master/bin/install.sh)"
```
Then add your api key in ```~/zshrc``` between the quotes of export API_KEY="".

## UNINSTALL

Delete the ```print_news``` directory from your ```$HOME``` directory.

Remove the command added to your ```~/.zshrc```:
```
export SUBJECT="Apple"
export COUNTRY="fr"
export API_KEY=""
export CITY="Lyon"
cat ~/todays_news
```

## CUSTOMIZATION

You can modifie the export's lines in .zshrc :

-CITY : according to your location to get the weather

-SUBJECT : to get articles about a subject you like

-COUNTRY : to get the top headline of your country
([Here](assets/country.txt) are all the available country)

You can display articales about more than one subject by adding other export SUBJECT[1..n], add this command:
```
curl https://newsapi.org/v2/everything -G -d q=$SUBJECT[1..n] -d sortBy=popularity -d apiKey=$API_KEY> ~/print_news/artciles/$SUBJECT[1..n]
```
And add the new var to this command :
```
./print_news/print_news ~/print_news/artciles/$SUBJECT[1..n] ~/print_news/artciles/$COUNTRY >> ~/todays_news
```

You can modifie the colors and the number of articles in ~/print_news/include/print_news.h.

A bash script is present to show you all the colors you terminal is addling. Type this command to use it:
```
sh  bin/script.sh |& less
```
To get the same terminal's color as i do go into your terminal settings then profiles/color Color Presets at the bottom right and select Solarized dark

## DOCUMENTATION

[Weather API](https://github.com/chubin/wttr.in)

[News API](https://newsapi.org/docs)
