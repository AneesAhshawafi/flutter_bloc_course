import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_course/constants/my_colors.dart';
import 'package:flutter_bloc_course/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        background: Hero(
          tag: character.id,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  image: character.image,
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
      maxLines: 100,
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
                      _buildCharacterIfo("Gender: ", character.gender),
                      _buildDivider(310),
                      _buildCharacterIfo(
                        "Status: ",
                        character.statusIfDeadOrAlive,
                      ),
                      _buildDivider(315),
                      _buildCharacterIfo(
                        "Locations: ",
                        character.location.values.join(" ||| "),
                        // character.location.entries
                        //     .map((entry) => "{$entry}")
                        //     .join(" | "),
                      ),
                      _buildDivider(310),
                      _buildCharacterIfo(
                        "Episodes Appeareance: ",
                        character.episodesAppeareance.join(" | "),
                      ),
                      _buildDivider(185),
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
