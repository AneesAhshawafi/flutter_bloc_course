import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_course/business_logic/cubit/quotes_cubit.dart';
import 'package:flutter_bloc_course/constants/my_colors.dart';
import 'package:flutter_bloc_course/data/models/characters.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  List<dynamic> quotes = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuotesCubit>(context).emitQoutes();
  }

  Widget _buildQuoteBlocWidgets() {
    return BlocBuilder<QuotesCubit, QuotesState>(
      builder: (context, State) {
        if (State is QuotesLoaded) {
          quotes = (State).quotes;
          return showLoadedQoutes(quotes);
        } else {
          return showLoadedIndicator();
        }
      },
    );
  }

  Widget showLoadedQoutes(List<dynamic> quotes) {
    String quote = "";
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      quote = quotes[randomQuoteIndex].quote;
      return Center(
        // width: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 35,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: Colors.white,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quote),
              // FlickerAnimatedText(quote1),
              // FlickerAnimatedText(quote2),
              // FlickerAnimatedText(quote3),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      );
    } else {
      return Container();
    }
    // String quote = quotes[0].quote;
    // String quote1 = quotes[1].quote;
    // String quote2 = quotes[2].quote;
    // String quote3 = quotes[3].quote;
    // print("quotes: ${quote}");
    // if (quote.isEmpty) {
    //   quote = "Empty Quote";
    // }

    // DefaultTextStyle(
    //   style: const TextStyle(fontSize: 20.0),
    //   child: AnimatedTextKit(
    //     animatedTexts: [
    //       WavyAnimatedText(quote),
    //       WavyAnimatedText(quote1),
    //       WavyAnimatedText(quote2),
    //       WavyAnimatedText(quote3),
    //     ],
    //     isRepeatingAnimation: true,
    //     onTap: () {
    //       print("Tap Event");
    //     },
    //   ),
    // );
    // 2
    //  SizedBox(
    //   width: 250.0,
    //   child: TextLiquidFill(
    //     text: quote,
    //     waveColor: Colors.blueAccent,
    //     boxBackgroundColor: Colors.redAccent,
    //     textStyle: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
    //     boxHeight: 300.0,
    //   ),
    // );
  }

  Widget showLoadedIndicator() {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          widget.character.name,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        background: Hero(
          tag: widget.character.id,
          child: widget.character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  image: widget.character.image,
                  placeholder: "assets/gifs/Loader.gif",
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/placeholder.png'),
        ),
      ),
    );
  }

  Widget _buildCharacterIfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // late String gender;
                      // late String image;
                      // late String statusIfDeadOrAlive;
                      // late List<dynamic> episodesAppeareance;
                      // late Map<String, dynamic> location;
                      _buildCharacterIfo("Gender: ", widget.character.gender),
                      _buildDivider(310),
                      _buildCharacterIfo(
                        "Status: ",
                        widget.character.statusIfDeadOrAlive,
                      ),
                      _buildDivider(315),
                      _buildCharacterIfo(
                        "Locations: ",
                        widget.character.location.values.join(" ||| "),
                        // character.location.entries
                        //     .map((entry) => "{$entry}")
                        //     .join(" | "),
                      ),
                      _buildDivider(310),
                      _buildCharacterIfo(
                        "Episodes Appeareance: ",
                        widget.character.episodesAppeareance.join(" | "),
                      ),
                      _buildDivider(185),
                      _buildQuoteBlocWidgets(),
                      SizedBox(height: 600),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
