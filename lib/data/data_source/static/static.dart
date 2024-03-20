import 'package:admin/core/constants/image_assets.dart';

import '../../model/onboarding_model.dart';

List<UnbordingModel> contents = [
  UnbordingModel(
      title: 'Centralized \nControl',
      image: ImageAssets.onBoardingFirstImage,
      description:
          "Take charge of your business with our \npowerful admin panel easily"
      //choisissez votre produit préféré facilement, rapidement, en toute sécurité
      ),
  UnbordingModel(
      title: 'Product \nManagement \nMade \nEasy',
      image: ImageAssets.onBoardingSecondImage,
      description:
          "Effortlessly update, add, or remove products \njust in one click"
      //nous avons +100 000 produits de haute qualité avec toutes les tailles et de belles couleurs rien que pour vous
      ),
  UnbordingModel(
      title: 'Security & \nPermissions',
      image: ImageAssets.onBoardingThirdImage,
      description:
          "Rest easy with top-notch security. Set user \nroles and permissions to ensure secure \naccess"
      //vous pouvez payer tous les produits que vous voulez en toute sécurité et en toute simplicité
      ),
];
