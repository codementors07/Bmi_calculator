import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Practice'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap:
              true, //whenerve any scrollable widget is under another scrollable widget then shrink wrap le chai aafno scroll banda garera parent scroll lai access garcha

          children: [
            //Widget list ma dekhauney
            ...List.generate(
                12,
                (index) => Container(
                      height: 50,
                      width: 50,
                      color: index % 2 == 0 ? Colors.green : Colors.red,
                      child: Text('data $index'),
                    )),

            const SizedBox(
              height: 30,
            ),

            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return index % 2 == 0
                      ? const Divider(
                          height: 2,
                          thickness: 2,
                          // color: Colors.green,
                        )
                      : const SizedBox(
                          height: 10,
                        );
                },
                itemBuilder: (context, index) {
                  return Text(
                    'data $index',
                    style: TextStyle(
                      fontSize: index % 2 == 0 ? 16 : 18,
                      fontWeight:
                          index % 2 == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  );
                }),

            GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 120),
                itemBuilder: (context, index) {
                  return Image.network(
                    index % 2 == 0
                        ? 'https://www.facebook.com/images/fb_icon_325x325.png'
                        : 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHMAvgMBEQACEQEDEQH/xAAbAAACAgMBAAAAAAAAAAAAAAAAAQIGAwQFB//EAEIQAAEDAwEEBwUFBQYHAAAAAAEAAgMEBRESBiExURMUIkFhcZEygaGxwRUjQlLRc5KisuFDcsLS4vAHJTNTYmOC/8QAGwEBAAIDAQEAAAAAAAAAAAAAAAEDAgQFBgf/xAAxEQACAgIBAwIEAwgDAAAAAAAAAQIDBBEFEiExE0EiMmFxUYHwFCMkkaGxwdEGQuH/2gAMAwEAAhEDEQA/APX8LJkBpUANKAWlAGEA8IAwgDCAEAKQGEBIKAHBANANASCAYQDQAgGgGgBACAiUBiAUgeFADSgDSgFpQBhARwgDCAeEBy9pqqaislRPTvLJBhocOIyQFXa2obNzAqjbkRjJdjzmOuqmfedbqA47y7pXfqtVN/ie0eNTrXQtfYs0VPtZFFBJHLM4S8G6muI3Z7WrgrkrEcWU+Km2nFdvv/gjJtFeqGd1PWCLpWe02SPf8E9SaemZR4vDvh11t6Ldaazr9vhqizQZG728iDj6K6L2tnn8qn0LpV73o2wFka40AwgGgBANANACAEBEoCICAMICWEAkA8IDHNJHDG6SaRsbG7y55wB71DevJlGMpPpitsrlw20tVOS2lL6yQf8AaGGfvHd6ZVTvivB1qOEyre8l0r6+f5Fbrtr7rWZELmUjOUW937x+gCpd0pHao4TGq7z+J/X/AEd3Yq8T1hmo62YyyNGuNz97i3gRnv7lbTNvszl8zgwo1ZWtJ+Tb24OnZ6buzIz5qb/kZp8Ut5S/M87DQ+Itz7TcLWie0keqWC/U1wtglmlZFNCwCoa440nn5FbcZJo8NlYVlNvRre/BStpLjFcrs+eD/pBoY1xHEDvVNkts9Lx2PLHo6ZeX3Llszj7Co8cCwn+Iq+v5Uec5J/xU/wBexyr9tcKCrNHRwCWVjsSPkOGjyxxVc7tPSNvA4h5EOuctIKDbaklwK2nkgP5mdtv6/NSrk/JldwV0e9ct/wBCwUdxoq0ZpamKTwDt/pxCsUkzlW49tL1OLRtrIoGEAIBoAQAgEUAsKQMBQBoAwgK7tveKuzW5jqFg6STV2yM6cDPqfoqL7JQj2OpxWFXlXdNj7I8VuN2uF0k13GtmqT3dI7IHkOA9y487JTfxM+iY+Fj4y1VBI9J2S2Mp7lYaKuq6qYPmaHhkRGkNzwORxI8sLp00xcE2eQ5Dm7ar511xWl27na2vsNuhsb56Wmip5KfBa6NuNQzgg8+KusgunsjR4vNvlkqM5NqRTrJWm33Smqc9lrwH/wB07j8FRB6kmeizqPXolD39vuen19DT3GkdBUN1RPwd3wK23FSWmeHptnRPrj5RWqnYeARPNJUyteAdDHAEZ7gqnRrwztV87Z2U4oqdNRTz1/UmR5qc40+HM+nwVMU29Hblk1xq9Zvsd52yFzacNlpfMuIA92FZ6UjnLm8fW2mWy0UbbTZqajdIXimh0ukIxnHE/NXQXRFI89kW/tF8p611M8qq6g1VdPO7OXyE/HP1Wj1bbZ7rFq9OmMfoWPYyx014dUy1hcYosMDGnGXHfkq+qCkts5PLchbjSjCv37m7cNjJaWKeppqoOEWXsYRh2kePNZur8CijmY2ONdkfP68HMt20VyoywCd08YI+7k7WR4HiFhGbRuZPGY9ib6dP6HpK2jxwIBoAQCQAUAwFIHhASATYHhNg5G1Vv6/ZZ2NbqkjHSMHiP6ZCqtj1QaN3j7/RyIyfjweA18Ap6yWIcA7s+R3hcOS1I+n0T9StSZe9hdrpLNbY6WpidPSAnToPbj3nOM8RnfhdDHv1BJnmOX4b17nZW9Sfn8Gdba7amnutJFSW/pOjcQ+Uvbp4cG/X0V1lqktRNXi+Lsx7HZau68f7ORa7FcrmW9WpntiP9rINLPU8fcsIwkzfyeRx8f5pbf4I9TpIDT0sMBdrMcbWaj34GMrcXg8RZLrm5a8mQt7sKTAxNp4o5HPZGxr3+04NALvMqNd9mTnKS02S0893mpMTSvLJX2msZTtc+UwuDWt4u3cB4rGW9PRfjuKui5eNnkWidgL56aeDUScSxubj1C0NNeT6DCdbWoyT+zLBsde22e4uFQT1WcBshG/QRwd8d6tqmovucrlsB5MFKHzI720m19NNSy0lsLpHSNLHS4w0DvxzKtnYvCOZgcRb1qy7sl7e5Wtn4RVXmigxkGQE+Te0fkqorctHZ5Cz08acvp/fsepLcPDDQAgGgEgAoCQCkEgAgGAoBJAIjKA8g2z2MuZuLpbbRvnjJOkRj8Pd6cFzMjHm5bij3XFcxjqnpulpmxZP+H94NHmsdDTneRGXann03BZ1Y01Hv2K8v/kOMrP3ab+vsFFszc23mnp6ilkMPStL5Q06Q0HJzy3LKNclLTIv5THljSlGXfXj3PUKqohoqd807wyNg3/oFvwhKcumKPFpNspl1286CTTTU50k94y7HPjgLqw41JfE+5sRo35ObNtleZj2DDTRnc0aNbz5k7vQLNYNMV37l8cRe4hddpakfdzVzv2VN/pT0sWPnRaqKI+WiTBta7fG67ccnU0b/ULF/sa9kZdOKvLQDaW+WSdoukcs0RPaZPHpf5tdwPyWLxqbl+7ejL9kpuW633LvST0d4oIqmNrZYZW7tTeHMHkRwXMsq6JOMkcxqyibjvTR5cdn7rT3aqoW0lTK0TkQylh0vYTuOry+q0HXJTaR7WnkceWNGyUlvXf7nem2Jr2QtdFPC+THaYcgA8gVl6MtHPhztDl3i0jpbJbPVlvrn1de1jC1hbG0OycniVZXW4vbNPlOSqyK1XV+ZblecAEA0AIAQCQGQKQSUMEkAIBoAUAMISGEBStuKp8lVFRtOGRt1uHNx4fBdXjoKMXN+Tcxq9rqKHJGRUull3AN1jPLJA+XxK3XYdGupMutG2l2Xs9NW1FM2oulW3U1r/wDGcDkACM8yuXOc756T0kaqhPKtcYvUUas22t3ccMbSx5OABE4n+b6IseteWbseKpXzNmB+0t/kmih6z0Ukr2saHRNaMkgd48Vl6VKW9GX7DiqDmltL6lg0z1tTPs7fnwVM7qfrFPURx6dwODkdxBI8wVQmov1Idjm9oRWRTtLemjBsHI5jKujdgBjg7A7jwPyVuZp6kXcrBPpsXuWtaRyAQAgBACAEAIAQAgMoUkEgoA0JGoA0JBACAEBSNrYv+bFx/FG0/T6LpYs9V6Ovgx6qym3MaYn/sSPRzx9FLs1s6lFfdr6lq25IdHapcgNdAcfw/qtOufTs0+JXxWL6/7C19Bs7YYLrLA2e4Vu+IO/A07wPDdxxxJUSk5sxtU83JdUXqEf1/cyUF/ZfaltqvlJCWVGRFJHkYcBnHgd24+Cjp6e8WMnAliR9emXjyaFkjloNt4IKiV8sjXSQmRziS4aMjj5BXTl1V9i/L6beP64rXv/AFOts4Oh2oucXAEyfzg/VRa91I1M5dWHXL7FswtY4okAIBIAQAgBACAEBmClkElBI1AGhIIAQAgA8EBVNrY81kLucePQ/wBVZG3ojo7PGP4JL6lMuMWphb/fafn/AIlq2ZJ2afmf5Ha2mb1rZawT9/QhpPiWD/KsbLemKl+Jz+NfRl2x/XkytgftHspQ9SIdW2/7qSHIByBgjfzABCzhZ1x3EwhasHNmrPlkYNnLBcBdoa24xOpKWkJkJlIBeQN2PAcSfBWRlJruXchn0ypdVT25GnFcBWbbUtXHujkrQG+LdJaPVWqXw6LrKHVxzhLyl/nZ36Fxj28rGdzgf5QVm3us59y3xkH+H/pbi1UnDIlqAWEAkAYQBhAJACAEBnCAkgBQBoSCAEAIAQHB2lgMggeO7IWvkNpdjpcfPpckUu5QOZUb+Dm5C4t9rTO9TNOOzq0cLrvsUymgGupoJS0xjiQM4/hK3It34vw+UcxzWNnuUvEiuwuqKSq6Wikmp6kdkmMb/ItI3+8LSrtsg+2zrWKm6HTPTX3OhUSbQ3WPoqjr1RGfw9AGNPnhoz710IW3T8o1q1gY8uqLSf32bli2cq6eviuV2YKSmpCZA17gXOIG7ODuA9Vv19WviKM7ka7K3TT8Tl2N3ZsG57S1dzwRECSzy4D4LY38GirO/h8OFD8l1wqzgi0qSBFqAiWoCJCAMIBYQBhALCAzhANQBoSCAEAIAQAgMFZTipgdGdx4g8iq7YdcXEzrm4S6il3yjlaO0zEsfs/+QXms2E4vUjv4l0X4ZxKGpnpKs1VuqOhmxpe1wy145OH+ytXHzLMeW4mxfRC+Opo7Z2su4ZpNPRB35u1+q6S5mXtFGiuKg38xqTbT3qQ4bV00Q/8AXED88rKPJ2zfbRsw4vGj823+ZCClu98e1tRPUVDAc5f2WD0AC6FE7LO7LJWYuGtxST/my9Wi2x22kbDGATxc7mVvnnsnIlkTcmb6GuCAEAsIAwEIDSEJFoCAWhALQpIJqCQQBlAGUAZQBlAGUAZQBlARfGyQYewOHIjKxlCMlqS2Sm14ObV2C0VTtU9FEX/mblp9QQteWFjy8wRdHJtj4kQh2essPs0UJ/aEv+ZKiODjx8QRLy73/wBmb8NNSQYEEMEePyNAWwq4x8Ipc5S8sz7jyWZiSQAgBACAEAIAQAgBACA1ett5hToDFW3mE0A603mE0A6yOYTQDp2800A6cc00BiYc0AzK096Ag4Ru4k+qnYMLqSmk9sOP/wBlNjZjNsoDxiB95U9TGxi10A/sGp1MbMrKGib7MDB7lG2DMyKFnssAUAygtHBAPUFAHqCAMhAGQgDIQBkIAygGgBAaf2dDzk/eQB9nw83+qbA+oRfmf6oBihi5v9UA+pR/mf6psB1OPm/1U7A+qR83+qgAaWMAnU7d4oDnfaVtDZHGd/3bdZGk5Ld28DG/igJx3C2vIDah2rdlha7UM8MjGRxHqEBF1ztrYukNQ4DSHEFpBAON5yNw3hAZ5qyhgfolmLXA4xg8cA44cd43eI5oBiqpHU3WIpTJHjVlm84zjOOPFAYGXWgc5zWSyPc0kOa1hJGCBwHiUAC7UJl6LpJBIXhgaWEEnhgIDJBcqOeRjI3vLnkADTjBIyM+5AdDoxzKANA5lAGgcygHp8SgDT4lAGnxKAePEoAwgGgBACAEAIAQAgE72T5IDTFuoXNDTRUxaG4A6Ju4HORwQEupUgBxSwdrj92N/wAEBH7PocE9Tps/sm/ogJGipC8PNLAXjeHdGMjuQE+rU5g6uYIjAQcxaBpPu4ICL6KklLRLSwPwcjVGDg5z896Ai230Me6OjpmgADsxNHDh3ICTaSmEwlFPCJBvDxGMju4+SA2kAIAQAgBACAEAID//2Q==',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          'assets/images/ss1.png'); // backup image
                    },
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  );
                }),

            const Image(
              image: AssetImage('assets/images/ss1.png'),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            const Image(
              image: AssetImage('assets/images/ss2.png'),
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
            const Image(
              image: AssetImage('assets/images/ss3.png'),
              height: 120,
              width: 120,
              fit: BoxFit.fitWidth,
            ),

            Image.asset('assets/images/ss1.png'),
            // Image.file(file)

            Image.network(
              'https://www.facebook.com/images/fb_icon_325x325.png',
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/ss1.png'); // backup image
              },
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),

            const Text(
              'Regular Fonts',
              style:
                  TextStyle(fontSize: 24, fontFamily: 'Montserrat Alternates'),
            ),
            const Text('Montserrat Alternates',
                style: TextStyle(
                    fontSize: 24, fontFamily: 'Montserrat Alternates')),

            CarouselSlider(
              items: const [
                // Container(
                //   height: 100,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.green,
                //   child: const Text('data1'),
                // ),
                // Container(
                //   height: 100,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.yellow,
                //   child: const Text('data2'),
                // ),
                // Container(
                //   height: 100,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.red,
                //   child: const Text('data3'),
                // ),
                // Container(
                //   height: 100,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.orange,
                //   child: const Text('data4'),
                // ),

                Image(
                  image: AssetImage('assets/images/ss1.png'),
                ),
                Image(image: AssetImage('assets/images/ss2.png')),
                Image(image: AssetImage('assets/images/ss3.png')),
              ],
              options: CarouselOptions(
                  aspectRatio: 12 / 8,
                  reverse: true,
                  autoPlay: true,
                  enlargeCenterPage: true),
            ),

            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: const [
                Image(
                  image: AssetImage('assets/images/ss1.png'),
                ),
                Positioned(
                  left: 70,
                  bottom: 30,
                  child: Text(
                    'data222',
                    style: TextStyle(color: Colors.amber, fontSize: 24),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
