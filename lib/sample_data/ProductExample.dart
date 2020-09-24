import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_main_category.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/model/shop/shop.dart';

class ProductExamples {
  static List<Product> mainList = [];
  static List<Product> sendableList = [];

  static List<Product> getList() {
    mainList = List(28);
    mainList[0] = Product(
        id: 0,
        uniqueID: "171e0bcea390c17fd70e3ffa6c2cd187",
        name: "FDT Women's Leggings",
        retailPrice: 699.0,
        deliveryPrice: 150.0,
        discountPrice: 55.79,
        images: [
          "http://img6a.flixcart.com/image/legging-jegging/f/c/7/1-1-lg-green08-fdt-xl-original-imae58jpwqj5gh5e.jpeg",
          "http://img5a.flixcart.com/image/legging-jegging/f/c/7/1-1-lg-green08-fdt-xl-original-imae58jpfg5zmjmg.jpeg",
          "http://img6a.flixcart.com/image/legging-jegging/f/c/7/1-1-lg-green08-fdt-xl-original-imae58jpqzshhphj.jpeg"
        ],
        description:
            "FDT Women's Leggings - Buy Parrot Green FDT Women's Leggings For Only LKR. 699 Online in India. Shop Online For Apparels. Huge Collection of Branded Clothes Only at Flipkart.com",
        rating: 1.5,
        qty: 293,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 1",
          "Fabric": "Cotton",
          "Type": "Leggings",
          "Waistband": "Elastic",
          "Pattern": "Solid",
          "Ideal For": "Women's"
        },
        saleCount: 449,
        returnCount: 4,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Fusion Wear",
        condition: ProductCondition.USED,
        model: "MDL29",
        brand: "FDT",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[1] = Product(
        id: 1,
        uniqueID: "c2d766ca982eca8304150849735ffef9",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 999.0,
        deliveryPrice: 150.0,
        discountPrice: 62.06,
        images: [
          "http://img5a.flixcart.com/image/short/u/4/a/altht-3p-21-alisha-38-original-imaeh2d5vm5zbtgg.jpeg",
          "http://img5a.flixcart.com/image/short/p/j/z/altght4p-26-alisha-38-original-imaeh2d5kbufss6n.jpeg",
          "http://img5a.flixcart.com/image/short/p/j/z/altght4p-26-alisha-38-original-imaeh2d5npdybzyt.jpeg",
          "http://img5a.flixcart.com/image/short/z/j/7/altght-7-alisha-38-original-imaeh2d5jsz2ghd6.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra Navy, Red, Navy,Specifications of Alisha Solid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 3 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach Additional Details Style Code ALTHT_3P_21 In the Box 3 shorts",
        rating: 0.0,
        qty: 445,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 3",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTHT_3P_21"
        },
        saleCount: 15,
        returnCount: 3,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.USED,
        model: "MDL1",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[2] = Product(
        id: 2,
        uniqueID: "7f7036a6d550aaa89d34c77bd39a5e48",
        name: "FabHomeDecor Fabric Double Sofa Bed",
        retailPrice: 32157.0,
        deliveryPrice: 150.0,
        discountPrice: 29.58,
        images: [
          "http://img6a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-1100x1100-imaeh3gemjjcg9ta.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-original-imaeh3gemjjcg9ta.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-original-imaeh3genfxkqvuv.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-original-imaeh3ge2sfeczef.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-original-imaeh3geuy7d74g2.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/j/f/y/fhd112-double-foam-fabhomedecor-leatherette-black-leatherette-original-imaeh3gerfhdxzwj.jpeg"
        ],
        description:
            "FabHomeDecor Fabric Double Sofa Bed (Finish Color - Leatherette Black Mechanism Type - Pull Out) Price: LKR. 22,646 • Fine deep seating experience • Save Space with the all new click clack Sofa Bed • Easy to fold and vice versa with simple click clack mechanism • Chrome legs with mango wood frame for long term durability • Double cushioned Sofa Bed to provide you with extra softness to make a fine seating experience • A double bed that can easily sleep two,Specifications of FabHomeDecor Fabric Double Sofa Bed (Finish Color - Leatherette Black Mechanism Type - Pull Out) Installation & Demo Installation & Demo Details Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product. In The Box 1 Sofa Bed General Brand FabHomeDecor Mattress Included No Delivery Condition Knock Down Storage Included No Mechanism Type Pull Out Type Sofa Bed Style Contemporary & Modern Filling Material Microfiber Seating Capacity 3 Seater Upholstery Type NA Upholstery Included No Bed Size Double Shape Square Suitable For Living Room Model Number FHD112 Care Instructions Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres, Try to avoid food and drink spillage of any kind, If spills occur, do not leave unattended, In case of a stain, a water-free fabric cleaner can be used, However, avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour, Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth, A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay, Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach, it will also make it more durable Finish Type Matte Important Note Cancellation NOT allowed for this product after 24 hrs of order booking. Warranty Covered in Warranty Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion. Service Type Manufacturer WarrantyWarranty Summary 6 Months Domestic Warranty Not Covered in Warranty Warranty does not cover for Improper Handling Dimensions Weight 40 kg Height 838 mm Width 1905 mm Depth 939 mm Disclaimer - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through...View More - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through the entrance(s) and door(s) of the premises - Please expect an unevenness of up to 5 mm in the product due to differences in surfaces and floor levels - Flipkart, or the Seller delivering the product, will not take up any type of civil work, such as drilling holes in the wall to mount the product. The product will only be assembled in case carpentry assembly is required - In case the product appears to lack shine, wiping the surface with a cloth will help clear the surface of dust particles Material & Color Upholstery Color Leatherette Black Primary Color Black Primary Material Fabric Secondary Material Subtype Mango Wood Secondary Material Foam Finish Color Leatherette Black Primary Material Subtype Foam",
        rating: 0.0,
        qty: 34,
        specifications: {
          "Installation & Demo Details":
              "Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product.",
          "Brand": "FabHomeDecor",
          "Mattress Included": "No",
          "Delivery Condition": "Knock Down",
          "Storage Included": "No",
          "Mechanism Type": "Pull Out",
          "Type": "Sofa Bed",
          "Style": "Contemporary and Modern",
          "Filling Material": "Microfiber",
          "Seating Capacity": "3 Seater",
          "Upholstery Type": "NA",
          "Upholstery Included": "No",
          "Bed Size": "Double",
          "Shape": "Square",
          "Suitable For": "Living Room",
          "Model Number": "FHD112",
          "Care Instructions":
              "Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres ,  Try to avoid food and drink spillage of any kind ,  If spills occur ,  do not leave unattended ,  In case of a stain ,  a water-free fabric cleaner can be used ,  However ,  avoid applying the cleaner directly on the stain as this cancause damage to the fabric and fade colour ,  Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth ,  A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay ,  Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach ,  it will also make it more durable",
          "Finish Type": "Matte",
          "Covered in Warranty":
              "Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion.",
          "Service Type": "Manufacturer Warranty",
          "Warranty Summary": "6 Months Domestic Warranty",
          "Not Covered in Warranty":
              "Warranty does not cover for Improper Handling",
          "Weight": "40 kg",
          "Height": "838 mm",
          "Width": "1905 mm",
          "Depth": "939 mm",
          "Upholstery Color": "Leatherette Black",
          "Primary Color": "Black",
          "Primary Material": "Fabric",
          "Secondary Material Subtype": "Mango Wood",
          "Secondary Material": "Foam",
          "Finish Color": "Leatherette Black",
          "Primary Material Subtype": "Foam"
        },
        saleCount: 44,
        returnCount: 4,
        headCategory: "Furniture",
        mainCategory: "Living Room Furniture",
        subCategory: "Sofa Beds & Futons",
        condition: ProductCondition.USED,
        model: "MDL2",
        brand: "Fabhomedecor",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[3] = Product(
      id: 3,
      uniqueID: "f449ec65dcbc041b6ae5e6a32717d01b",
      name: "AW Bellies",
      retailPrice: 999.0,
      deliveryPrice: 150.0,
      discountPrice: 50.05,
      images: [
        "http://img5a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeebfwsdf6jdf6.jpeg",
        "http://img6a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeebfwsdf6jdf6.jpeg",
        "http://img5a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeebfwt8zqc5cy.jpeg",
        "http://img5a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeebfwhz5f8v6m.jpeg",
        "http://img6a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeeducshzc6pbz.jpeg",
        "http://img6a.flixcart.com/image/shoe/7/z/z/red-as-454-aw-11-original-imaeebfw2veeuz8s.jpeg"
      ],
      description:
          "Key Features of AW Bellies Sandals Wedges Heel Casuals,AW Bellies Price: LKR. 499 Material: Synthetic Lifestyle: Casual Heel Type: Wedge Warranty Type: Manufacturer Product Warranty against manufacturing defects: 30 days Care instructions: Allow your pair of shoes to air and de-odorize at regular basis; use shoe bags to prevent any stains or mildew; dust any dry dirt from the surface using a clean cloth; do not use polish or shiner,Specifications of AW Bellies General Ideal For Women Occasion Casual Shoe Details Color Red Outer Material Patent Leather Heel Height 1 inch Number of Contents in Sales Package Pack of 1 In the Box One Pair Of Shoes",
      rating: 0.0,
      qty: 469,
      specifications: {
        "Ideal For": "Women",
        "Occasion": "Casual",
        "Color": "Red",
        "Outer Material": "Patent Leather",
        "Heel Height": "1 inch",
        "Number of Contents in Sales Package": "Pack of 1"
      },
      saleCount: 280,
      returnCount: 0,
      headCategory: "Footwear",
      mainCategory: "Women's Footwear",
      subCategory: "Ballerinas",
      condition: ProductCondition.USED,
      model: "MDL3",
      brand: "Aw",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );
    mainList[4] = Product(
        id: 4,
        uniqueID: "0973b37acd0c664e3de26e97e5571454",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 699.0,
        deliveryPrice: 150.0,
        discountPrice: 61.8,
        images: [
          "http://img5a.flixcart.com/image/short/6/2/h/altght-11-alisha-38-original-imaeh2d5uq9thnyg.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5jxvh4msy.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5yz9fcjxe.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5fa94gzuy.jpeg",
          "http://img6a.flixcart.com/image/short/x/5/f/altght-2-alisha-36-original-imaeh2d5xnueazgz.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra Black, Red,Specifications of AlishaSolid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 2 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach Additional Details Style Code ALTGHT_11 In the Box 2 shorts",
        rating: 0.0,
        qty: 312,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 2",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTGHT_11"
        },
        saleCount: 129,
        returnCount: 0,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.USED,
        model: "MDL4",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[5] = Product(
        id: 5,
        uniqueID: "bc940ea42ee6bef5ac7cea3fb5cfbee7",
        name: "Sicons All Purpose Arnica Dog Shampoo",
        retailPrice: 220.0,
        deliveryPrice: 150.0,
        discountPrice: 4.55,
        images: [
          "http://img5a.flixcart.com/image/pet-shampoo/r/j/5/sh-df-14-sicons-500-1100x1100-imaeh3hfvav85tva.jpeg",
          "http://img5a.flixcart.com/image/pet-shampoo/r/j/5/sh-df-14-sicons-500-original-imaeh3hfvav85tva.jpeg"
        ],
        description:
            "Specifications of Sicons All Purpose Arnica Dog Shampoo (500 ml) General Pet Type Dog Brand Sicons Quantity 500 ml Model Number SH.DF-14 Type All Purpose Fragrance Arnica Form Factor Liquid In the Box Sales Package Shampoo Sicons Dog Fashion Arnica",
        rating: 0.0,
        qty: 163,
        specifications: {
          "Pet Type": "Dog",
          "Brand": "Sicons",
          "Quantity": "500 ml",
          "Model Number": "SH.DF-14",
          "Type": "All Purpose",
          "Fragrance": "Arnica",
          "Form Factor": "Liquid",
          "Sales Package": "Shampoo Sicons Dog Fashion Arnica"
        },
        saleCount: 214,
        returnCount: 3,
        headCategory: "Pet Supplies",
        mainCategory: "Grooming",
        subCategory: "Skin & Coat Care",
        condition: ProductCondition.USED,
        model: "MDL5",
        brand: "Sicons",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[6] = Product(
      id: 6,
      uniqueID: "c2a17313954882c1dba461863e98adf2",
      name:
          "Eternal Gandhi Super Series Crystal Paper Weights  with Silver Finish",
      retailPrice: 430.0,
      deliveryPrice: 150.0,
      discountPrice: 30.0,
      images: [
        "http://img5a.flixcart.com/image/paper-weight/u/e/3/eternal-gandhi-gandhi-paper-weight-mark-v-1100x1100-imaeb8adyf3xmqhf.jpeg",
        "http://img5a.flixcart.com/image/paper-weight/u/e/3/eternal-gandhi-gandhi-paper-weight-mark-v-original-imaeb8adyf3xmqhf.jpeg"
      ],
      description:
          "Key Features of Eternal Gandhi Super Series Crystal Paper Weights  with Silver Finish Crystal  paper weight Product Dimensions :   8cm x  8cm x 5cm A beautiful product Material: Crystal,Eternal Gandhi Super Series Crystal Paper Weights  with Silver Finish (Set Of 1, Clear) Price: LKR. 430 Your office desk will sparkle and shine when you accent tables with this elegant crystal paper weight. The multifaceted crystal features Gandhiji’s bust and his timeless message – “My life is my message – M.K. Gandhi”. A beautiful product to gift to your near and dear ones in family and Business.,Specifications of Eternal Gandhi Super Series Crystal Paper Weights  with Silver Finish (Set Of 1, Clear) General Model Name Gandhi Paper Weight Mark V Dimensions Weight 323 g In the Box Paper Weight Paper Weight Features Paper Weight Material Crystal Paper Weight Finish Silver Finish",
      rating: 0.0,
      qty: 676,
      specifications: {
        "Model Name": "Gandhi Paper Weight Mark V",
        "Weight": "323 g",
        "Paper Weight Material": "Crystal",
        "Paper Weight Finish": "Silver Finish"
      },
      saleCount: 155,
      returnCount: 4,
      headCategory: "Eternal Gandhi Super Series Crystal Paper Weight...",
      mainCategory: "Main Cat",
      subCategory: "Sub Cat",
      condition: ProductCondition.USED,
      model: "MDL6",
      brand: "Eternal gandhi",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );

    mainList[7] = Product(
        id: 7,
        uniqueID: "ce5a6818f7707e2cb61fdcdbba61f5ad",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 1199.0,
        deliveryPrice: 150.0,
        discountPrice: 60.05,
        images: [
          "http://img6a.flixcart.com/image/short/p/j/z/altght4p-26-alisha-38-original-imaeh2d5cqtxe5gt.jpeg",
          "http://img5a.flixcart.com/image/short/z/j/7/altght-7-alisha-38-original-imaeh2d5jsz2ghd6.jpeg",
          "http://img5a.flixcart.com/image/short/p/j/z/altght4p-26-alisha-38-original-imaeh2d5kbufss6n.jpeg",
          "http://img5a.flixcart.com/image/short/p/j/z/altght4p-26-alisha-38-original-imaeh2d5npdybzyt.jpeg",
          "http://img6a.flixcart.com/image/short/x/5/f/altght-2-alisha-36-original-imaeh2d5xnueazgz.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra Navy, Red, White, Red,Specifications of Alisha Solid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 4 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's In the Box 4 shorts Additional Details Style Code ALTGHT4P_26 Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach",
        rating: 0.0,
        qty: 509,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 4",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTGHT4P_26"
        },
        saleCount: 311,
        returnCount: 2,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL7",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[8] = Product(
      id: 8,
      uniqueID: "8542703ca9e6ebdf6d742638dfb1f2ca",
      name: "FabHomeDecor Fabric Double Sofa Bed",
      retailPrice: 32157.0,
      deliveryPrice: 150.0,
      discountPrice: 29.58,
      images: [
        "http://img6a.flixcart.com/image/sofa-bed/e/x/n/fhd107-double-foam-fabhomedecor-brown-brown-1100x1100-imaeh3geypmfrc5a.jpeg",
        "http://img6a.flixcart.com/image/sofa-bed/e/x/n/fhd107-double-foam-fabhomedecor-brown-brown-original-imaeh3geypmfrc5a.jpeg",
        "http://img6a.flixcart.com/image/sofa-bed/e/x/n/fhd107-double-foam-fabhomedecor-brown-brown-original-imaeh3geadxsdz2f.jpeg",
        "http://img5a.flixcart.com/image/sofa-bed/e/x/n/fhd107-double-foam-fabhomedecor-brown-brown-original-imaeh3gehnzcjfzv.jpeg"
      ],
      description:
          "FabHomeDecor Fabric Double Sofa Bed (Finish Color - Brown Mechanism Type - Pull Out) Price: LKR. 22,646 • Fine deep seating experience • Save Space with the all new click clack Sofa Bed • Easy to fold and vice versa with simple click clack mechanism • Chrome legs with mango wood frame for long term durability • Double cushioned Sofa Bed to provide you with extra softness to make a fine seating experience • A double bed that can easily sleep two,Specifications of FabHomeDecor Fabric Double Sofa Bed (Finish Color - Brown Mechanism Type - Pull Out) Installation & Demo Installation & Demo Details Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product. In The Box 1 Sofa Bed General Brand FabHomeDecor Mattress Included No Delivery Condition Knock DownStorage Included No Mechanism Type Pull Out Type Sofa Bed Style Contemporary & Modern Filling Material Microfiber Seating Capacity 3 Seater Upholstery Type NA Upholstery Included No Bed Size Double Shape Square Suitable For Living Room Model Number FHD107 Care Instructions Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres, Try to avoid food and drink spillage of any kind, If spills occur, do not leave unattended, In case of a stain, a water-free fabric cleaner can be used, However, avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour, Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth, A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay, Getting your sofa professionally cleaned onceevery 6-8 months will not only take care of the nooks and corners that you can't reach, it will also make it more durable Finish Type Matte Important Note Cancellation NOT allowed for this product after 24 hrs of order booking. Warranty Covered in Warranty Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion. Service Type Manufacturer Warranty Warranty Summary 6 Months Domestic Warranty Not Covered in Warranty Warranty does not cover for Improper Handling Dimensions Weight 40 kg Height 838 mm Width 1905 mm Depth 939 mm Disclaimer - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through...View More - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through the entrance(s) and door(s) of the premises - Please expect an unevenness of up to 5 mm in the product due to differences in surfaces and floor levels - Flipkart, or the Seller delivering the product, will not take up any type of civil work, such as drilling holes in the wall to mount the product. The product will only be assembled in case carpentry assembly is required - In case the product appears to lack shine, wiping the surface with a cloth will help clear the surface of dust particles Material & Color Upholstery Color Brown Primary Color Brown Primary Material Fabric Secondary Material Subtype Mango Wood Secondary Material Foam Finish Color Brown Primary Material Subtype Foam",
      rating: 0.0,
      qty: 861,
      specifications: {
        "Installation & Demo Details":
            "Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product.",
        "Brand": "FabHomeDecor",
        "Mattress Included": "No",
        "Delivery Condition": "Knock Down",
        "Storage Included": "No",
        "Mechanism Type": "Pull Out",
        "Type": "Sofa Bed",
        "Style": "Contemporary and Modern",
        "Filling Material": "Microfiber",
        "Seating Capacity": "3 Seater",
        "Upholstery Type": "NA",
        "Upholstery Included": "No",
        "Bed Size": "Double",
        "Shape": "Square",
        "Suitable For": "Living Room",
        "Model Number": "FHD107",
        "Care Instructions":
            "Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres ,  Try to avoid food and drink spillage of any kind ,  If spills occur ,  do not leave unattended ,  In case of a stain ,  a water-free fabric cleaner can be used ,  However ,  avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour ,  Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth ,  A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay ,  Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach ,  it will also make it more durable",
        "Finish Type": "Matte",
        "Covered in Warranty":
            "Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion.",
        "Service Type": "Manufacturer Warranty",
        "Warranty Summary": "6 Months Domestic Warranty",
        "Not Covered in Warranty":
            "Warranty does not cover for Improper Handling",
        "Weight": "40 kg",
        "Height": "838 mm",
        "Width": "1905 mm",
        "Depth": "939 mm",
        "Upholstery Color": "Brown",
        "Primary Color": "Brown",
        "Primary Material": "Fabric",
        "Secondary Material Subtype": "Mango Wood",
        "Secondary Material": "Foam",
        "Finish Color": "Brown",
        "Primary Material Subtype": "Foam"
      },
      saleCount: 442,
      returnCount: 3,
      headCategory: "Furniture",
      mainCategory: "Living Room Furniture",
      subCategory: "Sofa Beds & Futons",
      condition: ProductCondition.BRAND_NEW,
      model: "MDL8",
      brand: "Fabhomedecor",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );

    mainList[9] = Product(
        id: 9,
        uniqueID: "29c8d290caa451f97b1c32df64477a2c",
        name: "dilli bazaaar Bellies~ Corporate Casuals~ Casuals",
        retailPrice: 699.0,
        deliveryPrice: 150.0,
        discountPrice: 50.07,
        images: [
          "http://img6a.flixcart.com/image/shoe/b/p/n/pink-200db202-dilli-bazaaar-10-original-imaeh2zz4x6hnuwf.jpeg",
          "http://img6a.flixcart.com/image/shoe/b/p/n/pink-200db202-dilli-bazaaar-10-original-imaeh2zzxp8s7gru.jpeg",
          "http://img6a.flixcart.com/image/shoe/s/c/k/pink-200db202-dilli-bazaaar-9-original-imaeh2zzv2hzkepv.jpeg",
          "http://img5a.flixcart.com/image/shoe/b/p/n/pink-200db202-dilli-bazaaar-10-original-imaeh2zztckv2tqj.jpeg"
        ],
        description:
            "Key Features of dilli bazaaar Bellies, Corporate Casuals, Casuals Material: Fabric Occasion: Ethnic, Casual, Party, Formal Color: Pink Heel Height: 0,Specifications of dilli bazaaar Bellies, Corporate Casuals, Casuals General Occasion Ethnic, Casual, Party, Formal Ideal For Women Shoe Details Weight 200 g (per single Shoe) - Weight of the product may vary depending on size. Heel Height 0 inch Outer Material Fabric Color Pink",
        rating: 0.0,
        qty: 278,
        specifications: {
          "Occasion": "Ethnic ,  Casual ,  Party ,  Formal",
          "Ideal For": "Women",
          "Weight":
              "200 g (per single Shoe) - Weight of the product may vary depending on size.",
          "Heel Height": "0 inch",
          "Outer Material": "Fabric",
          "Color": "Pink"
        },
        saleCount: 248,
        returnCount: 2,
        headCategory: "Footwear",
        mainCategory: "Women's Footwear",
        subCategory: "Ballerinas",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL9",
        brand: "Dilli bazaaar",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[10] = Product(
        id: 10,
        uniqueID: "4044c0ac52c1ee4b28777417651faf42",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 1199.0,
        deliveryPrice: 150.0,
        discountPrice: 60.05,
        images: [
          "http://img5a.flixcart.com/image/short/5/z/c/altght4p-39-alisha-38-original-imaeh2d5ar6m55zd.jpeg",
          "http://img5a.flixcart.com/image/short/z/h/b/altght-9-alisha-36-original-imaeh2d5khxcdggw.jpeg",
          "http://img6a.flixcart.com/image/short/z/h/b/altght-9-alisha-36-original-imaeh2d5yj4cnjtz.jpeg",
          "http://img6a.flixcart.com/image/short/z/h/b/altght-9-alisha-36-original-imaeh2d55eacbgwg.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5jxvh4msy.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra White, Black, Red, Black,Specifications of Alisha Solid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 4 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach Additional Details Style Code ALTGHT4P_39 In the Box 4 shorts",
        rating: 0.0,
        qty: 175,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 4",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTGHT4P_39"
        },
        saleCount: 392,
        returnCount: 2,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL10",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[11] = Product(
      id: 11,
      uniqueID: "e54bc0a7c3429da2ebef0b30331fe3d2",
      name: "Ladela Bellies",
      retailPrice: 1724.0,
      deliveryPrice: 150.0,
      discountPrice: 44.9,
      images: [
        "http://img5a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaega8phqh6tf4e.jpeg",
        "http://img6a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaega8phqh6tf4e.jpeg",
        "http://img6a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaeh3w9sc3nhuwa.jpeg",
        "http://img5a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaeh3w99nazagyp.jpeg",
        "http://img5a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaeh3w9pyfvmqap.jpeg",
        "http://img5a.flixcart.com/image/shoe/s/g/m/black-r998-22-ladela-38-original-imaeh3w9cycrgdgt.jpeg"
      ],
      description:
          "Key Features of Ladela Bellies Brand: LADELA Color : Black,Ladela Bellies Price: LKR. 950 Experience the best bellies from the house of Ladela. Providing the best material to keep your feet cozy and active for the whole day.,Specifications of Ladela Bellies General Occasion Casual Ideal For Women Shoe Details Heel Height 0 inch Outer Material PU Color Black",
      rating: 5.0,
      qty: 169,
      specifications: {
        "Occasion": "Casual",
        "Ideal For": "Women",
        "Heel Height": "0 inch",
        "Outer Material": "PU",
        "Color": "Black"
      },
      saleCount: 184,
      returnCount: 2,
      headCategory: "Footwear",
      mainCategory: "Women's Footwear",
      subCategory: "Ballerinas",
      condition: ProductCondition.BRAND_NEW,
      model: "MDL11",
      brand: "Ladela",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );

    mainList[12] = Product(
        id: 12,
        uniqueID: "c73e78fb440ff8972e0762daed4fc109",
        name: "Carrel Printed Women's",
        retailPrice: 2299.0,
        deliveryPrice: 150.0,
        discountPrice: 60.42,
        images: [
          "http://img6a.flixcart.com/image/swimsuit/5/v/9/carrel-sw-3091-black-white01-carrel-4xl-original-imaehyzm2sywfavb.jpeg",
          "http://img5a.flixcart.com/image/swimsuit/g/g/x/carrel-sw-3091-black-white01-carrel-xl-original-imaehyzmmvg6b7uy.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/5/v/9/carrel-sw-3091-black-white01-carrel-4xl-original-imaehyzmvffqbdde.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/5/v/9/carrel-sw-3091-black-white01-carrel-4xl-original-imaehyzmgnqtwjpg.jpeg",
          "http://img5a.flixcart.com/image/swimsuit/5/v/9/carrel-sw-3091-black-white01-carrel-4xl-original-imaehyzmb4smucms.jpeg"
        ],
        description:
            "Key Features of Carrel Printed Women's Fabric: SwimLycra Brand Color: Black, White,Carrel Printed Women's Price: LKR. 910 Max-coverage swimwear collection from CARREL BRAND, Brighten up your swim routine with this best fitting. This swimming costume from the house of Carrel is made of imported swim lycra fabric and comes in Black & White Colour. It has to be washed separately and dry in shade. Attractive & classy caressing the water. This swimwear provides excellent protection and Chlorine resistance. fast drying combined with flatlock stitching gives an unmatched comfort and helps you to that performance you have been striving for. This swimwear with its comfort and style is your perfect companion at any pool, beach or water activity. Time for you to do your own thing and Go With The Flow. This Swimwear Lightly padded, for modesty and support. This Product Support To This Size : L, XL, XXL, 3XL,4XL.,Specifications of Carrel Printed Women's Top Details Neck Round Neck Swimsuit Details Fabric SwimLycra Type Swim-dress General Details Pattern Printed Ideal For Women's Occasion Sports Fabric Care Wash with Similar Colors, Use Detergent for Colors In the Box 1 Swimware",
        rating: 0.0,
        qty: 907,
        specifications: {
          "Neck": "Round Neck",
          "Fabric": "SwimLycra",
          "Type": "Swim-dress",
          "Pattern": "Printed",
          "Ideal For": "Women's",
          "Occasion": "Sports"
        },
        saleCount: 349,
        returnCount: 1,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Sports & Gym Wear",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL12",
        brand: "Carrel",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[13] = Product(
        id: 13,
        uniqueID: "c29af37837afcaf44b779eca7c19295f",
        name: "Sicons All Purpose Tea Tree Dog Shampoo",
        retailPrice: 1000.0,
        deliveryPrice: 150.0,
        discountPrice: 100.0,
        images: [
          "http://img6a.flixcart.com/image/pet-shampoo/c/c/d/sh-df-07-sicons-200-1100x1100-imaeh3kvn25fznjt.jpeg",
          "http://img6a.flixcart.com/image/pet-shampoo/c/c/d/sh-df-07-sicons-200-original-imaeh3kvn25fznjt.jpeg"
        ],
        description:
            "Specifications of Sicons All Purpose Tea Tree Dog Shampoo (200 ml) General Pet Type Dog Brand Sicons Quantity 200 ml Model Number SH.DF-07 Type All Purpose Fragrance Tea Tree Form Factor Spray In the Box Sales Package Shampoo Sicons Dog Fashion Dry Bath Urban Pet",
        rating: 0.0,
        qty: 625,
        specifications: {
          "Pet Type": "Dog",
          "Brand": "Sicons",
          "Quantity": "200 ml",
          "Model Number": "SH.DF-07",
          "Type": "All Purpose",
          "Fragrance": "Tea Tree",
          "Form Factor": "Spray",
          "Sales Package": "Shampoo Sicons Dog Fashion Dry Bath Urban Pet"
        },
        saleCount: 430,
        returnCount: 3,
        headCategory: "Pet Supplies",
        mainCategory: "Grooming",
        subCategory: "Skin & Coat Care",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL13",
        brand: "Sicons",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[14] = Product(
        id: 14,
        uniqueID: "9aacdecceb404c74abddc513fd2756a8",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 999.0,
        deliveryPrice: 150.0,
        discountPrice: 62.06,
        images: [
          "http://img6a.flixcart.com/image/short/q/z/v/altht-3p-17-alisha-36-original-imaeh2d5njykvkz6.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5yz9fcjxe.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5fa94gzuy.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5jxvh4msy.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra Black, White, Black,Specifications of Alisha Solid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 3 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach Additional Details Style Code ALTHT_3P_17 In the Box 3 shorts",
        rating: 0.0,
        qty: 444,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 3",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTHT_3P_17"
        },
        saleCount: 398,
        returnCount: 3,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL14",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[15] = Product(
      id: 15,
      uniqueID: "83c53f8948f508f51d2249b489ca8e7d",
      name: "Freelance Vacuum Bottles 350 ml Bottle",
      retailPrice: 699.0,
      deliveryPrice: 150.0,
      discountPrice: 0.0,
      images: [
        "http://img5a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-1000x1000-imaegykdk6ytzrzz.jpeg",
        "http://img6a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-original-imaegykdk6ytzrzz.jpeg",
        "http://img6a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-original-imaegykd57fmyhqa.jpeg",
        "http://img5a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-original-imaegykd6yfj5wrx.jpeg",
        "http://img6a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-original-imaegykdgxzzetjw.jpeg",
        "http://img5a.flixcart.com/image/bottle/j/m/m/av004bgr-freelance-350-vacuum-bottles-original-imaegykdy3humv3v.jpeg"
      ],
      description:
          "Specifications of Freelance Vacuum Bottles 350 ml Bottle (Pack of 1, Green) General Body Material Stainless steel Type Bottle In the Box Number of Contents in Sales Package Pack of 1 Sales Package 1 pcs in one packet",
      rating: 5.0,
      qty: 708,
      specifications: {
        "Body Material": "Stainless steel",
        "Type": "Bottle",
        "Number of Contents in Sales Package": "Pack of 1",
        "Sales Package": "1 pcs in one packet"
      },
      saleCount: 287,
      returnCount: 1,
      headCategory: "Pens & Stationery",
      mainCategory: "School Supplies",
      subCategory: "Water Bottles",
      condition: ProductCondition.BRAND_NEW,
      model: "MDL15",
      brand: "Freelance",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );
    mainList[16] = Product(
        id: 16,
        uniqueID: "d95b0456a0350bc42f2393c6e84b0f09",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 999.0,
        deliveryPrice: 150.0,
        discountPrice: 62.06,
        images: [
          "http://img5a.flixcart.com/image/short/t/p/b/altht-3p-2-alisha-38-original-imaeh2d53jbrxnam.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5jxvh4msy.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5yz9fcjxe.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5fa94gzuy.jpeg",
          "http://img5a.flixcart.com/image/short/z/h/b/altght-9-alisha-36-original-imaeh2d5khxcdggw.jpeg"
        ],
        description:
            "Key Features of Alisha Solid Women's Cycling Shorts Cotton Lycra Black, White, White,Specifications of Alisha Solid Women's Cycling Shorts Shorts Details Number of Contents in Sales Package Pack of 3 Fabric Cotton Lycra Type Cycling Shorts General Details Pattern Solid Ideal For Women's Fabric Care Gentle Machine Wash in Lukewarm Water, Do Not Bleach Additional Details Style Code ALTHT_3P_2 In the Box 3 shorts",
        rating: 0.0,
        qty: 200,
        specifications: {
          "Number of Contents in Sales Package": "Pack of 3",
          "Fabric": "Cotton Lycra",
          "Type": "Cycling Shorts",
          "Pattern": "Solid",
          "Ideal For": "Women's",
          "Style Code": "ALTHT_3P_2"
        },
        saleCount: 275,
        returnCount: 3,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL16",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[17] = Product(
        id: 17,
        uniqueID: "849ab05698081a374215d0b7d18047d0",
        name: "FabHomeDecor Fabric Double Sofa Bed",
        retailPrice: 32157.0,
        deliveryPrice: 150.0,
        discountPrice: 29.58,
        images: [
          "http://img5a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-1100x1100-imaeh3getyhdnnxn.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3getyhdnnxn.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3gehkzxd64a.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3getztbhygx.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3ge5qgadxgh.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3gefhxg2vxy.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/r/c/g/fhd132-double-foam-fabhomedecor-purple-purple-original-imaeh3gfmx3wjstu.jpeg"
        ],
        description:
            "FabHomeDecor Fabric Double Sofa Bed (Finish Color - Purple Mechanism Type - Pull Out) Price: LKR. 22,646 • Fine deep seating experience • Save Space with the all new click clack Sofa Bed • Easy to fold and vice versa with simple click clack mechanism • Chrome legs with mango wood frame for long term durability • Double cushioned Sofa Bed to provide you with extra softness to make a fine seating experience • A double bed that can easily sleep two,Specifications of FabHomeDecor Fabric Double Sofa Bed (Finish Color - Purple Mechanism Type - Pull Out) Installation & Demo Installation & Demo Details Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product. In The Box 1 Sofa Bed General Brand FabHomeDecor Mattress Included No Delivery Condition Knock Down Storage Included No Mechanism Type Pull Out Type Sofa Bed Style Contemporary & Modern Filling Material Microfiber Seating Capacity 3 Seater Upholstery Type NA Upholstery Included No Bed Size Double Shape Square Suitable For Living Room Model Number FHD132 Care Instructions Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres, Try to avoid food and drink spillage of any kind, If spills occur, do not leave unattended, In case of a stain, a water-free fabric cleaner can be used, However, avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour, Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth, A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay, Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach, it will also make it more durable Finish Type Matte Important Note Cancellation NOT allowed for this product after 24 hrs of order booking. Warranty Covered in Warranty Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion. Service Type Manufacturer Warranty Warranty Summary 6 Months Domestic Warranty Not Covered in Warranty Warranty does not cover for Improper Handling Dimensions Weight 40 kg Height 838 mm Width 1905 mm Depth 939 mm Disclaimer - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through...View More - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through the entrance(s) and door(s) of the premises - Please expect an unevenness of up to 5 mm in the product due to differences in surfaces and floor levels - Flipkart, or the Seller delivering the product, will not take up any type of civil work, such as drilling holes in the wall to mount the product. The product will only be assembled in case carpentry assembly is required - In case the product appears to lack shine, wiping the surface with a cloth will help clear the surface of dust particles Material & Color Upholstery Color Purple Primary Color Purple Primary Material Fabric Secondary Material Subtype Mango Wood Secondary Material Foam Finish Color Purple Primary Material Subtype Foam",
        rating: 0.0,
        qty: 386,
        specifications: {
          "Installation & Demo Details":
              "Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product.",
          "Brand": "FabHomeDecor",
          "Mattress Included": "No",
          "Delivery Condition": "Knock Down",
          "Storage Included": "No",
          "Mechanism Type": "Pull Out",
          "Type": "Sofa Bed",
          "Style": "Contemporary and Modern",
          "Filling Material": "Microfiber",
          "Seating Capacity": "3 Seater",
          "Upholstery Type": "NA",
          "Upholstery Included": "No",
          "Bed Size": "Double",
          "Shape": "Square",
          "Suitable For": "Living Room",
          "Model Number": "FHD132",
          "Care Instructions":
              "Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres ,  Try to avoid food and drink spillage of any kind ,  If spills occur ,  do not leave unattended ,  In case of a stain ,  a water-free fabric cleaner can be used ,  However ,  avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour ,  Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth ,  A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay ,  Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach ,  it will also make it more durable",
          "Finish Type": "Matte",
          "Covered in Warranty":
              "Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion.",
          "Service Type": "Manufacturer Warranty",
          "Warranty Summary": "6 Months Domestic Warranty",
          "Not Covered in Warranty":
              "Warranty does not cover for Improper Handling",
          "Weight": "40 kg",
          "Height": "838 mm",
          "Width": "1905 mm",
          "Depth": "939 mm",
          "Upholstery Color": "Purple",
          "Primary Color": "Purple",
          "Primary Material": "Fabric",
          "Secondary Material Subtype": "Mango Wood",
          "Secondary Material": "Foam",
          "Finish Color": "Purple",
          "Primary Material Subtype": "Foam"
        },
        saleCount: 442,
        returnCount: 1,
        headCategory: "Furniture",
        mainCategory: "Living Room Furniture",
        subCategory: "Sofa Beds & Futons",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL17",
        brand: "Fabhomedecor",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[18] = Product(
        id: 18,
        uniqueID: "c275ee5ac19f774a3ef7da71b40aabd8",
        name: "Style Foot Bellies",
        retailPrice: 899.0,
        deliveryPrice: 150.0,
        discountPrice: 50.06,
        images: [
          "http://img5a.flixcart.com/image/shoe/p/f/h/black-sfwf0377-style-foot-44-original-imaeh4cxasyrdtjr.jpeg",
          "http://img5a.flixcart.com/image/shoe/v/t/m/black-sfwf0377-style-foot-43-original-imaeh4cx4c7w8nuc.jpeg",
          "http://img5a.flixcart.com/image/shoe/p/f/h/black-sfwf0377-style-foot-44-original-imaeh4cxyruxf2pr.jpeg",
          "http://img5a.flixcart.com/image/shoe/p/f/h/black-sfwf0377-style-foot-44-original-imaeh4cxzzcbeudz.jpeg",
          "http://img5a.flixcart.com/image/shoe/v/t/m/black-sfwf0377-style-foot-43-original-imaeh4cxvjpek25n.jpeg"
        ],
        description:
            "Key Features of Style Foot Bellies ballerina shoes ballerina flats,Style Foot Bellies Price: LKR. 449 ballet shoes that fits perfectly for casual and party wear,Specifications of Style Foot Bellies General Occasion Casual Ideal For Women Shoe Details Heel Height 1 inch Outer Material PU Color Black In the Box 1 slipper",
        rating: 0.0,
        qty: 98,
        specifications: {
          "Occasion": "Casual",
          "Ideal For": "Women",
          "Heel Height": "1 inch",
          "Outer Material": "PU",
          "Color": "Black"
        },
        saleCount: 116,
        returnCount: 4,
        headCategory: "Footwear",
        mainCategory: "Women's Footwear",
        subCategory: "Ballerinas",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL18",
        brand: "Style foot",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[19] = Product(
        id: 19,
        uniqueID: "4f3511c33a6869b1d5102cd97818ef00",
        name: "Carrel Printed Women's",
        retailPrice: 2499.0,
        deliveryPrice: 150.0,
        discountPrice: 60.02,
        images: [
          "http://img5a.flixcart.com/image/swimsuit/g/z/j/carrel-sw-3091-darkblue-white-carrel-4xl-original-imaehyzmk8hphgua.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/g/z/j/carrel-sw-3091-darkblue-white-carrel-4xl-original-imaehyzmmgz3fgny.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/g/z/j/carrel-sw-3091-darkblue-white-carrel-4xl-original-imaehyzmjgcfwacx.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/g/z/j/carrel-sw-3091-darkblue-white-carrel-4xl-original-imaehyzms4b9k2vf.jpeg",
          "http://img6a.flixcart.com/image/swimsuit/g/z/j/carrel-sw-3091-darkblue-white-carrel-4xl-original-imaehyzmgf2j2yh4.jpeg"
        ],
        description:
            "Key Features of Carrel Printed Women's Fabric: SwimLycra Brand Color: DARK BLUE, WHITE,Carrel Printed Women's Price: LKR. 999 Max-coverage swimwear collection from CARREL BRAND, Brighten up your swim routine with this best fitting. This swimming costume from the house of Carrel is made of imported swim lycra fabric and comes in Darkblue & White Colour. It has to be washed separately and dry in shade. Attractive & classy caressing the water. This swimwear provides excellent protection and Chlorine resistance. fast drying combined with flatlock stitching gives an unmatched comfort and helps you to that performance you have been striving for. This swimwear with its comfort and style is your perfect companion at any pool, beach or water activity. Time for you to do your own thing and Go With The Flow. This Swimwear Lightly padded, for modesty and support. This Product Support To This Size : L, XL, XXL, 3XL,4XL.,Specifications of Carrel Printed Women's Top Details Neck Round Neck Swimsuit Details Fabric SwimLycra Type Swim-dress General Details Pattern Printed Ideal For Women's Occasion Sports Fabric Care Wash with Similar Colors, Use Detergent for Colors In the Box 1 Swimware",
        rating: 0.0,
        qty: 410,
        specifications: {
          "Neck": "Round Neck",
          "Fabric": "SwimLycra",
          "Type": "Swim-dress",
          "Pattern": "Printed",
          "Ideal For": "Women's",
          "Occasion": "Sports"
        },
        saleCount: 226,
        returnCount: 2,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Sports & Gym Wear",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL19",
        brand: "Carrel",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[20] = Product(
        id: 20,
        uniqueID: "7ee3e337474a29b38cfe1f5d4020d633",
        name: "FabHomeDecor Fabric Double Sofa Bed",
        retailPrice: 32157.0,
        deliveryPrice: 150.0,
        discountPrice: 29.58,
        images: [
          "http://img6a.flixcart.com/image/sofa-bed/j/6/q/fhd115-double-foam-fabhomedecor-dark-brown-dark-brown-original-imaeh3gee5zcazvm.jpeg",
          "http://img5a.flixcart.com/image/sofa-bed/j/6/q/fhd115-double-foam-fabhomedecor-dark-brown-dark-brown-original-imaeh3gehqgbxhhq.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/j/6/q/fhd115-double-foam-fabhomedecor-dark-brown-dark-brown-original-imaeh3get5j5mqfw.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/j/6/q/fhd115-double-foam-fabhomedecor-dark-brown-dark-brown-original-imaeh3gezh3uxkux.jpeg",
          "http://img6a.flixcart.com/image/sofa-bed/j/6/q/fhd115-double-foam-fabhomedecor-dark-brown-dark-brown-original-imaeh3geexpwnmeb.jpeg"
        ],
        description:
            "FabHomeDecor Fabric Double Sofa Bed (Finish Color - Dark Brown Mechanism Type - Pull Out) Price: LKR. 22,646 • Fine deep seating experience • Save Space with the all new click clack Sofa Bed • Easy to fold and vice versa with simple click clack mechanism • Chrome legs with mango wood frame for long term durability • Double cushioned Sofa Bed to provide you with extra softness to make a fine seating experience • A double bed that can easily sleep two,Specifications of FabHomeDecor Fabric Double Sofa Bed (Finish Color - Dark Brown Mechanism Type - Pull Out) In The Box 1 Sofa Bed Installation & Demo Installation & Demo Details Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product. Important Note Cancellation NOT allowed for this product after 24 hrs of order booking. General Brand FabHomeDecor Mattress Included No Delivery Condition Knock Down Storage Included No Mechanism Type Pull Out Type Sofa Bed Style Contemporary & Modern Filling Material Microfiber Seating Capacity 3 Seater Upholstery Type NA Upholstery Included No Bed Size Double Shape Square Suitable For Living Room Model Number FHD115 Finish Type Matte Care Instructions Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hardto repair, Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture, Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade, Keep sharp objects away from your sofa, A little tear on the fabric cover may be hard to repair, Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres, Try to avoid food and drink spillage of any kind, If spills occur, do not leave unattended, In case of a stain, a water-free fabric cleaner can be used, However, avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour, Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth, A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay, Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach, it will also make it more durable Dimensions Weight 40 kg Height 838.2 mm Width 1905 mm Depth 939.8 mm Warranty Covered in Warranty Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion. Warranty Summary 6 Months Domestic Warranty Service Type Manufacturer Warranty Not Covered in Warranty Warranty does not cover for Improper Handling Disclaimer -The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through...View More - The color of the product may vary slightly compared to the picture displayed on your screen. This is due to lighting, pixel quality and color settings - Please check the product's dimensions to ensure the product will fit in the desired location. Also, check if the product will fit through the entrance(s) and door(s) of the premises - Please expect an unevenness of up to 5 mm in the product due to differences in surfaces and floor levels - Flipkart, or the Seller delivering the product, will not take up any type of civil work, such as drilling holes in the wall to mount the product. The product will only be assembled in case carpentry assembly is required - In case the product appears to lack shine, wiping the surface with a cloth will help clear the surface of dust particles Material & Color Primary Material Fabric Primary Color Brown Upholstery Color Dark Brown Secondary Material Foam Secondary Material Subtype Mango Wood Finish Color Dark Brown Primary Material Subtype Foam",
        rating: 0.0,
        qty: 306,
        specifications: {
          "Installation & Demo Details":
              "Installation and demo for this product is done free of cost as part of this purchase. Our service partner will visit your location within 72 business hours from the delivery of the product.",
          "Brand": "FabHomeDecor",
          "Mattress Included": "No",
          "Delivery Condition": "Knock Down",
          "Storage Included": "No",
          "Mechanism Type": "Pull Out",
          "Type": "Sofa Bed",
          "Style": "Contemporary and Modern",
          "Filling Material": "Microfiber",
          "Seating Capacity": "3 Seater",
          "Upholstery Type": "NA",
          "Upholstery Included": "No",
          "Bed Size": "Double",
          "Shape": "Square",
          "Suitable For": "Living Room",
          "Model Number": "FHD115",
          "Finish Type": "Matte",
          "Care Instructions":
              "Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled bru...View More Avoid outdoor use and exposure to water or prolonged moisture ,  Avoid exposure to direct heat or sunlight as this can cause the sofa colour to fade ,  Keep sharp objects away from your sofa ,  A little tear on the fabric cover may be hard to repair ,  Vacuum your sofas periodically with a soft bristled brush attachment or lightly brush them to keep general dirt and dust off the sofa and prevent any embedding between the fibres ,  Try to avoid food and drink spillage of any kind ,  If spills occur ,  do not leave unattended ,  In case of a stain ,  a water-free fabric cleaner can be used ,  However ,  avoid applying the cleaner directly on the stain as this can cause damage to the fabric and fade colour ,  Pour the cleaner onto a clean cloth and test its effect on a hidden area of the sofa before cleaning the stain with the cloth ,  A professional scotchguard treatment is one of the easiest and most effective options to protect against spills or stains and keep pet hair at bay ,  Getting your sofa professionally cleaned once every 6-8 months will not only take care of the nooks and corners that you can't reach ,  it will also make it more durable",
          "Weight": "40 kg",
          "Height": "838.2 mm",
          "Width": "1905 mm",
          "Depth": "939.8 mm",
          "Covered in Warranty":
              "Warranty covers all kind of manufacturing defects. Concerned product will either be repaired or replaced based on discretion.",
          "Warranty Summary": "6 Months Domestic Warranty",
          "Service Type": "Manufacturer Warranty",
          "Not Covered in Warranty":
              "Warranty does not cover for Improper Handling",
          "Primary Material": "Fabric",
          "Primary Color": "Brown",
          "Upholstery Color": "Dark Brown",
          "Secondary Material": "Foam",
          "Secondary Material Subtype": "Mango Wood",
          "Finish Color": "Dark Brown",
          "Primary Material Subtype": "Foam"
        },
        saleCount: 136,
        returnCount: 0,
        headCategory: "Furniture",
        mainCategory: "Living Room Furniture",
        subCategory: "Sofa Beds & Futons",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL20",
        brand: "Fabhomedecor",
        shop: Shop.exampleShop,
        isFavorite: 1,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");

    mainList[21] = Product(
      id: 21,
      uniqueID: "f35f27525ab8f5988d3817ee9bb02ce1",
      name: "Sicons Conditioning Conditoner Dog Shampoo",
      retailPrice: 110.0,
      deliveryPrice: 150.0,
      discountPrice: 9.09,
      images: [
        "http://img6a.flixcart.com/image/pet-shampoo/v/x/m/sh-df-02-sicons-200-1100x1100-imaeh3kjba4htqfg.jpeg",
        "http://img5a.flixcart.com/image/pet-shampoo/v/x/m/sh-df-02-sicons-200-original-imaeh3kjba4htqfg.jpeg"
      ],
      description:
          "Specifications of Sicons Conditioning Conditoner Dog Shampoo (200 ml) General Pet Type Dog Brand Sicons Quantity 200 ml Model Number SH.DF-02 Type Conditioning Fragrance Conditoner Form Factor Gel In the Box Sales Package Shampoo Sicons Dog Fashion Conditioner Aloe Rinse",
      rating: 0.0,
      qty: 770,
      specifications: {
        "Pet Type": "Dog",
        "Brand": "Sicons",
        "Quantity": "200 ml",
        "Model Number": "SH.DF-02",
        "Type": "Conditioning",
        "Fragrance": "Conditoner",
        "Form Factor": "Gel",
        "Sales Package": "Shampoo Sicons Dog Fashion Conditioner Aloe Rinse"
      },
      saleCount: 395,
      returnCount: 4,
      headCategory: "Pet Supplies",
      mainCategory: "Grooming",
      subCategory: "Skin & Coat Care",
      condition: ProductCondition.BRAND_NEW,
      model: "MDL21",
      brand: "Sicons",
      shop: Shop.exampleShop,
      isFavorite: 0,
      currency: "LKR",
    );
    mainList[22] = Product(
        id: 22,
        uniqueID: "ea98a65ad1e1b8688eddf89fbc7b3e27",
        name: "Alisha Solid Women's Cycling Shorts",
        retailPrice: 1000.0,
        deliveryPrice: 150.0,
        discountPrice: 100.0,
        images: [
          "http://img6a.flixcart.com/image/short/m/g/y/altht-3p-18-alisha-34-original-imaeh2d5zgnh6vsb.jpeg",
          "http://img5a.flixcart.com/image/short/m/g/y/altht-3p-18-alisha-34-original-imaeh2d5zgnh6vsb.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5jxvh4msy.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5yz9fcjxe.jpeg",
          "http://img6a.flixcart.com/image/short/p/h/t/altht-3p-1-alisha-34-original-imaeh2d5fa94gzuy.jpeg",
          "http://img5a.flixcart.com/image/short/z/j/7/altght-7-alisha-38-original-imaeh2d5jsz2ghd6.jpeg"
        ],
        description:
            "Alisha Solid Women's Cycling Shorts - Buy Black, White, Navy Alisha Solid Women's Cycling Shorts For Only LKR. 999 Online in India. Shop Online For Apparels. Huge Collection of Branded Clothes Only at Flipkart.com",
        rating: 0.0,
        qty: 341,
        specifications: {},
        saleCount: 145,
        returnCount: 0,
        headCategory: "Clothing",
        mainCategory: "Women's Clothing",
        subCategory: "Lingerie",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL22",
        brand: "Alisha",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[23] = Product(
        id: 23,
        uniqueID: "7a7ba93ab20a2b50fd5a7dc74bcba063",
        name: "dongli Printed Boy's Round Neck T-Shirt",
        retailPrice: 2400.0,
        deliveryPrice: 150.0,
        discountPrice: 56.71,
        images: [
          "http://img5a.flixcart.com/image/t-shirt/w/x/t/dlhbb445-beige-black-gyellow-purple-dongli-10-11-years-original-imaehb54gxhchxcd.jpeg",
          "http://img6a.flixcart.com/image/t-shirt/w/x/t/dlhbb445-beige-black-gyellow-purple-dongli-10-11-years-original-imaehb54gxhchxcd.jpeg",
          "http://img5a.flixcart.com/image/t-shirt/f/n/f/dlhbb445-beige-black-gyellow-purple-dongli-15-16-years-original-imaehb55kjd6g4kg.jpeg",
          "http://img6a.flixcart.com/image/t-shirt/g/y/5/dlhbb445-beige-black-gyellow-purple-dongli-12-13-years-original-imaehb54re656maf.jpeg"
        ],
        description:
            "Specifications of dongli Printed Boy's RoundNeck T-Shirt (Pack of 4) T-shirt Details Sleeve Half Sleeve Number of Contents in Sales Package Pack of 4 Fabric Cotton Type Round Neck Fit Regular General Details Pattern Printed Occasion Casual Ideal For Boy's In the Box 4 T Shirt Additional Details Style Code DLHBB445_BEIGE_BLACK_GYELLOW_PURPLE Fabric Care Wash with Similar Colors, Use Detergent for Colors",
        rating: 0.0,
        qty: 457,
        specifications: {
          "Sleeve": "Half Sleeve",
          "Number of Contents in Sales Package": "Pack of 4",
          "Fabric": "Cotton",
          "Type": "Round Neck",
          "Fit": "Regular",
          "Pattern": "Printed",
          "Occasion": "Casual",
          "Ideal For": "Boy's",
          "Style Code": "DLHBB445_BEIGE_BLACK_GYELLOW_PURPLE"
        },
        saleCount: 441,
        returnCount: 2,
        headCategory: "Clothing",
        mainCategory: "Kids' Clothing",
        subCategory: "Boys Wear",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL23",
        brand: "Dongli",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.ONLY_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[24] = Product(
        id: 24,
        uniqueID: "9c26a5d85a59d6a34a199ae1df836ec3",
        name: "SWAGGA Women Clogs",
        retailPrice: 1500.0,
        deliveryPrice: 150.0,
        discountPrice: 0.0,
        images: [
          "http://img6a.flixcart.com/image/sandal/h/7/v/brown-white17-swagga0040-swagga-47-original-imaeh6zhxgymnwjx.jpeg",
          "http://img5a.flixcart.com/image/sandal/h/7/v/brown-white17-swagga0040-swagga-47-original-imaeh6zhxgymnwjx.jpeg",
          "http://img5a.flixcart.com/image/sandal/e/f/6/brown-black001-swagga0025-swagga-36-original-imaeh6zhsqwh8gaz.jpeg"
        ],
        description:
            "Key Features of SWAGGA Women Clogs Occasion: Ethnic Material: Leather Color: Brown, White Heel Height: 0,Specifications of SWAGGA Women Clogs General Occasion Ethnic Ideal For Women Sandal Details Type Clogs Heel Height 0 inch Outer Material Leather Color Brown, White13",
        rating: 0.0,
        qty: 420,
        specifications: {
          "Occasion": "Ethnic",
          "Ideal For": "Women",
          "Type": "Clogs",
          "Heel Height": "0 inch",
          "Outer Material": "Leather",
          "Color": "Brown ,  White13"
        },
        saleCount: 369,
        returnCount: 0,
        headCategory: "Footwear",
        mainCategory: "Women's Footwear",
        subCategory: "Sports Sandals",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL24",
        brand: "Swagga",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[25] = Product(
        id: 25,
        uniqueID: "20cf08ae845d5fd8f2b8cf52b3b9d840",
        name:
            "Kennel Rubber Dumbell With Bell - Small Rubber Rubber Toy For Dog",
        retailPrice: 190.0,
        deliveryPrice: 150.0,
        discountPrice: 0.0,
        images: [
          "http://img5a.flixcart.com/image/pet-toy/n/a/r/a35-kennel-original-imaea5c3qxyqzrgz.jpeg"
        ],
        description:
            "Buy Kennel Rubber Dumbell With Bell - Small Rubber Rubber Toy For Dog for LKR.190 online. Kennel Rubber Dumbell With Bell - Small Rubber Rubber Toy For Dog at best prices with FREE shipping & cash on delivery. Only Genuine Products. 30 Day Replacement Guarantee.",
        rating: 0.0,
        qty: 481,
        specifications: {
          "Pet Type": "Dog",
          "Brand": "Kennel",
          "Suitable For": "Adult ,  Young",
          "Activity Type": "Training",
          "Model Number": "A35",
          "Type": "Rubber Toy",
          "Model Name": "Rubber Dumbell With Bell - Small",
          "Material": "Rubber",
          "Chewable": "No",
          "Color": "Multicolor",
          "Weight": "159 g",
          "Sales Package": "Hard Toy",
          "Pack of": "1"
        },
        saleCount: 352,
        returnCount: 3,
        headCategory: "Pet Supplies",
        mainCategory: "Toys",
        subCategory: "Comfort Toys",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL25",
        brand: "Kennel",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[26] = Product(
        id: 26,
        uniqueID: "ea91e47cac68b132887d7fc1175e91c2",
        name: "Veelys Shiny White Quad Roller Skates - Size 4.5 UK",
        retailPrice: 3199.0,
        deliveryPrice: 150.0,
        discountPrice: 21.88,
        images: [
          "http://img6a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jpf8c5nmxfy.jpeg",
          "http://img5a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jpf8c5nmxfy.jpeg",
          "http://img5a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jpfqfgzvmzc.jpeg",
          "http://img6a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jp2jkbhx4gc.jpeg",
          "http://img5a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jp5swnmwnxz.jpeg",
          "http://img5a.flixcart.com/image/skate/w/y/7/ve-ar-2132-w-4-5-1-veelys-quad-roller-shiny-white-original-imae5jpyfbmh4m4r.jpeg"
        ],
        description:
            "Veelys Shiny White Quad Roller Skates - Size 4.5 UK only for LKR 2499 . Ideal For Boys . Buy online @ Flipkart.com. Only Genuine Products. Free Shipping. Cash On Delivery!",
        rating: 0.0,
        qty: 463,
        specifications: {
          "Playing Level": "Advanced",
          "Age Group": "4 - 18 Years",
          "Type": "Quad Roller",
          "Ideal For": "Boys",
          "Shoe Size": "4.5 UK",
          "Weight": "400 g",
          "Number of Contents in Sales Package": "Pack of 1",
          "Sales Package": "Pair Of Shoes",
          "Lining": "No",
          "Closure Type": "Automatic Rollers"
        },
        saleCount: 471,
        returnCount: 1,
        headCategory: "Sports & Fitness",
        mainCategory: "Other Sports",
        subCategory: "Skating",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL27",
        brand: "Veelys",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    mainList[27] = Product(
        id: 27,
        uniqueID: "bec784ef794cf596dbe2cbbaf5427ef0",
        name: "Bulaky vanity case Jewellery Vanity Case",
        retailPrice: 499.0,
        deliveryPrice: 150.0,
        discountPrice: 21.84,
        images: [
          "http://img6a.flixcart.com/image/vanity-box/8/5/t/j-635-bulaky-vanity-case-1100x1100-imadzy6atzfswnag.jpeg",
          "http://img6a.flixcart.com/image/vanity-box/8/5/t/j-635-bulaky-vanity-case-original-imadzy6atzfswnag.jpeg",
          "http://img5a.flixcart.com/image/vanity-box/8/5/t/j-635-bulaky-vanity-case-original-imadzy6awxhnqxuy.jpeg"
        ],
        description:
            "Buy Bulaky vanity case Jewellery Vanity Case for LKR.390 online. Bulaky vanity case Jewellery Vanity Case at best prices with FREE shipping & cash on delivery. Only Genuine Products. 30 Day Replacement Guarantee.",
        rating: 3.0,
        qty: 251,
        specifications: {"Body Material": "croco leather material"},
        saleCount: 329,
        returnCount: 4,
        headCategory: "Beauty and Personal Care",
        mainCategory: "Makeup",
        subCategory: "Vanity Boxes",
        condition: ProductCondition.BRAND_NEW,
        model: "MDL28",
        brand: "Bulaky",
        shop: Shop.exampleShop,
        isFavorite: 0,
        currency: "LKR",
        dealingState: ProductDealingType.BARTER_AND_SELL,
        inTheBox: "1 peice of the product and sticker.");
    sendableList.clear();
    mainList.forEach((p) {
      sendableList.add(p);
    });
    return sendableList;
  }

  static Future<List<Product>> getSearchedList(String query) async {
    List<Product> lit = getList();
    return Future.delayed(
        Duration(seconds: 2),
        () => lit
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList());
  }

  static Future<List<Product>> getExampleProductList() async {
    List<Product> lit = getList();
    lit.shuffle();
    return Future.delayed(Duration(seconds: 1), () => lit);
  }

  static Future<List<MainCategory>> getMainCategoryList() async {
    return [];
    // List<MainCategory> lct = List(10);
    // lct[0] = Category(
    //   1,
    //   "Electronic",
    //   "https://img.favpng.com/23/24/19/iphone-telephone-logo-smartphone-clip-art-png-favpng-KgDH0v3AnWMtcn2gAcHyDpeDn.jpg",
    // );
    // lct[1] = Category(
    //   1,
    //   "Home",
    //   "https://toppng.com/uploads/preview/television-icon-tv-media-icon-11553527032hi8xonemxq.png",
    // );
    // lct[2] = Category(
    //   1,
    //   "Health & Beauty",
    //   "https://www.pngfind.com/pngs/m/85-858539_png-file-svg-health-product-icon-png-transparent.png",
    // );
    // lct[3] = Category(
    //   1,
    //   "Babies",
    //   "https://banner2.cleanpng.com/20180422/low/kisspng-computer-icons-skin-care-emoticon-baby-products-5adc3c790f4734.6038283515243828410626.jpg",
    // );
    // lct[4] = Category(
    //   1,
    //   "Groceries",
    //   "https://i7.pngguru.com/preview/169/424/954/organic-food-grocery-store-computer-icons-supermarket-product.jpg",
    // );
    // lct[5] = Category(
    //   1,
    //   "Lifestyle",
    //   "https://icons-for-free.com/iconfiles/png/512/furniture+living+sofa+icon-1320183237491749710.png",
    // );
    // lct[6] = Category(
    //   1,
    //   "Fashion",
    //   "https://cdn1.iconfinder.com/data/icons/fitness/500/T-shirt-512.png",
    // );
    // lct[7] = Category(
    //   1,
    //   "Accessories",
    //   "https://png.pngtree.com/element_our/png_detail/20181130/watch-vector-icon-png_255353.jpg",
    // );
    // lct[8] = Category(
    //   1,
    //   "Sports",
    //   "https://cdn.iconscout.com/icon/premium/png-256-thumb/football-ball-1435030-1215771.png",
    // );
    // lct[9] = Category(
    //   1,
    //   "Automotive",
    //   "https://library.kissclipart.com/20180831/jqq/kissclipart-car-side-icon-clipart-car-computer-icons-clip-art-e806bac699b2c013.jpg",
    // );
    // return Future.delayed(Duration(seconds: 2), () => lct);
  }
}
// User(
//   id: 1,
//   userId: "u0001",
//   userType: UserType.SELLER_AND_BUYER,
//   title: "Mr.",
//   gender: "Male",
//   fname: "Kanishka",
//   lname: "Bandara",
//   fullName: "Kanishka Udayakantha Bandara",
//   emails: <Email>[
//     Email(
//       id: 1,
//       emailType: EmailType.AUTHENTICATION,
//       isDefault: 1,
//       email: "wmkubandara@gmail.com",
//       status: 1,
//       emailTypeId: EmailType.AUTHENTICATION.index,
//       userId: 1,
//     )
//   ],
//   country: "Sri Lanka",
//   activeState: 1,
//   note: "Good",
//   profilePicUrl:
//       // "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5d2388f14c687b00085c0f91%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D0%26cropX2%3D1559%26cropY1%3D130%26cropY2%3D1690",
//       "http://192.168.8.100:8080/profile/55_20200517111834_.jpg",
//   status: 1,
//   username: "kanishka12345",
//   password: "123",
//   addresses: [
//     Address(
//       id: 1,
//       typeId: AddressType.DELIVERY.index,
//       type: AddressType.DELIVERY,
//       name: "Kanishka Bandara",
//       poCode: "192/2",
//       poArea: "Handapanagala",
//       userId: 1,
//       street: "Handapanagala",
//       city: "Wellawaya",
//       district: "Monaragala",
//       province: "Uva",
//       country: "Sri Lanka",
//       isDefaultAddress: 0,
//       state: 1,
//     ),
//     Address(
//       id: 1,
//       typeId: AddressType.DELIVERY.index,
//       type: AddressType.DELIVERY,
//       name: "Kanishka Bandara",
//       poCode: "192/2",
//       poArea: "Handapanagala",
//       userId: 1,
//       street: "Handapanagala",
//       city: "Wellawaya",
//       district: "Monaragala",
//       province: "Uva",
//       country: "Sri Lanka",
//       isDefaultAddress: 1,
//       state: 1,
//     ),
//     Address(
//       id: 1,
//       typeId: AddressType.BILLING.index,
//       type: AddressType.BILLING,
//       name: "Kanishka Bandara",
//       poCode: "192/2",
//       poArea: "Handapanagala",
//       userId: 1,
//       street: "Handapanagala",
//       city: "Wellawaya",
//       district: "Monaragala",
//       province: "Uva",
//       country: "Sri Lanka",
//       isDefaultAddress: 1,
//       state: 1,
//     ),
//   ],
// );
