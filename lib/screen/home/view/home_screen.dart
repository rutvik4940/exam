import 'package:exam/screen/home/controller/home_controller.dart';
import 'package:exam/screen/model/db_model.dart';
import 'package:exam/utils/helper/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shopping", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("cart");
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          controller.l1.value == null
              ? const Center(child: CircularProgressIndicator())
              : Obx(
                  () => Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 270,
                              crossAxisSpacing: 5),
                      itemCount: controller.l1.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.network(
                                  "${controller.l1.value[index].image}",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${controller.l1.value[index].category}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("₹ ${controller.l1.value[index].price}"),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "${controller.l1.value[index].ratingModel!.rate}"),
                              const SizedBox(
                                width: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      DbModel model = DbModel(
                                        category: controller.l1[index].category,
                                        rate: controller
                                            .l1[index].ratingModel!.rate
                                            .toString(),
                                        price: controller.l1[index].price!
                                            .toString(),
                                      );
                                      DbHelper.helper.insertProduct(model);
                                      controller.getProductData();
                                      Get.snackbar(
                                        "Favorite to Product",
                                        "success",
                                        backgroundColor: Colors.white,
                                      );
                                    },
                                    icon: const Icon(Icons.favorite),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
