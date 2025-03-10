// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ChocoNft} from "../src/ChocoNft.sol";
import {console} from "forge-std/console.sol";
import {ChocoCoin} from "../src/ChocoCoin.sol";

contract DeployMoodNft is Script {
    function run() external returns (ChocoNft, ChocoCoin) {
        string[30] memory _tokenURIs;

        _tokenURIs[
            0
        ] = "https://ipfs.io/ipfs/bafkreibkjh2aczdvn52l7377b6oawpik4upu7zxnnkhvy6p2myvc37u5mm";
        _tokenURIs[
            1
        ] = "https://ipfs.io/ipfs/bafkreicjmiidlq3edw6ppfaqowxy5zzcsbeoe5mjjjpv4bt3vxog2m5g6a";
        _tokenURIs[
            2
        ] = "https://ipfs.io/ipfs/bafkreieu4evsmfruatfkuchi3c5kbo5h5w4l4f7hypxkpd5x7cvux3jpbm";
        _tokenURIs[
            3
        ] = "https://ipfs.io/ipfs/bafkreifmrw7bsm4r3nyeouupgv7ag6dbap4wm3f3d5qwfque6x57ttjbj4";
        _tokenURIs[
            4
        ] = "https://ipfs.io/ipfs/bafkreifhccznxmi7yzz4wuzrtu3xhcy5bezziglpfftq43xfmnv2zwcmfa";
        _tokenURIs[
            5
        ] = "https://ipfs.io/ipfs/bafkreigc73gl7x4l2p3uzksr43hk3n7sp3qnvsl4wfwjk2hnaonsrf3ihq";
        _tokenURIs[
            6
        ] = "https://ipfs.io/ipfs/bafkreib76qi5hbopkqbbayayyyjtgjfzex3dqmonkqnkiqhn2elgiaekuq";
        _tokenURIs[
            7
        ] = "https://ipfs.io/ipfs/bafkreicz2sbmxhltp5uyvuwpaidc3jxrpz2kbeuaucg6dvi6unszy5bkiq";
        _tokenURIs[
            8
        ] = "https://ipfs.io/ipfs/bafkreibn2x5zfgkkvtwaqvi2vmbetscdgdoq3ttriq57zgy773xmbqphzi";
        _tokenURIs[
            9
        ] = "https://ipfs.io/ipfs/bafkreibmpvuwhbsdktm6qxaiml72mgxvefyzbotpluxlahg3fo6pk2irbm";
        _tokenURIs[
            10
        ] = "https://ipfs.io/ipfs/bafkreidni264vurdtpi6iuidghxny5ri6lk34eh7awacaer2nfadvaeh2q";
        _tokenURIs[
            11
        ] = "https://ipfs.io/ipfs/bafkreicdtywcprynatteixr4vbzgktzqos4rhisysfzp4kdj2nhgakl7mi";
        _tokenURIs[
            12
        ] = "https://ipfs.io/ipfs/bafkreigqpwm6l6pl7m3kwzsbzl4b3g6syikqnr4mj27z25v24der4nrdfi";
        _tokenURIs[
            13
        ] = "https://ipfs.io/ipfs/bafkreibtgirfhuv7wkuxtoi66j22ffc3lajlqmng5jdkxazn7j4i2xkioe";
        _tokenURIs[
            14
        ] = "https://ipfs.io/ipfs/bafkreibetd77abxqpjwflgxoqaxa6cm3a42xgqwc27khmza2jdjpaufih4";
        _tokenURIs[
            15
        ] = "https://ipfs.io/ipfs/bafkreihef7l6ncdgnkfvmauvxeeiegkhbula5wapgfbasyyoytuf6udwwy";
        _tokenURIs[
            16
        ] = "https://ipfs.io/ipfs/bafkreibjchdhqihi2p2sp6qope6ogbfsvepwb4fxlvso77kry3ptgauweq";
        _tokenURIs[
            17
        ] = "https://ipfs.io/ipfs/bafkreidqbpfit4bzm4rliwko5vn35fillympunmigm6be6jtfiaq4ngbw4";
        _tokenURIs[
            18
        ] = "https://ipfs.io/ipfs/bafkreiah6n3efbbp66dqv5fguqimeioqrkzkknxb4bz6evf6ebcf4nd4nm";
        _tokenURIs[
            19
        ] = "https://ipfs.io/ipfs/bafkreidjw7at64uuddudeqfyxosv3g63w2o3whg4qisnexjlzpaxhnzgi4";
        _tokenURIs[
            20
        ] = "https://ipfs.io/ipfs/bafkreiarvxe547frumuer2p7vjbiafwuhfc6yv2nfzlibo7u7ioa4mb55m";
        _tokenURIs[
            21
        ] = "https://ipfs.io/ipfs/bafkreiep6oqngev6numq6zcuwcgct3zorf36kfkzfkgngbyuvx3ewl7h6m";
        _tokenURIs[
            22
        ] = "https://ipfs.io/ipfs/bafkreiejjmqsaa6qfuewwajs6bzprp56bos5mo4runzavaqcnxdmcpefne";
        _tokenURIs[
            23
        ] = "https://ipfs.io/ipfs/bafkreieuvtkkb2vcf5gyqlubsshm5wykp4j4pplvr2fuxsil7kbugsalei";
        _tokenURIs[
            24
        ] = "https://ipfs.io/ipfs/bafkreibjfyv5j3zwwswkuzk7gcxpnrqzbvxbmebohs2szhqihl5g24l7qq";
        _tokenURIs[
            25
        ] = "https://ipfs.io/ipfs/bafkreibpoierfydboa7ola2gj42moc3jv5phbbc4sni65ljjor2gp642iq";
        _tokenURIs[
            26
        ] = "https://ipfs.io/ipfs/bafkreiayts2lrxxekehivwrkm5iwpskfsq3wmtjdtuxwpwkhrdo3lenmoq";
        _tokenURIs[
            27
        ] = "https://ipfs.io/ipfs/bafkreiae4uo6rgsxycn72pqtw64dc7zjxnnh2mwuiyej2wawd45wi3izry";
        _tokenURIs[
            28
        ] = "https://ipfs.io/ipfs/bafkreig66n7i3bittzzgasw5hf5qr6o4jqgrv24yakxi7znkpfy3eqypwe";
        _tokenURIs[
            29
        ] = "https://ipfs.io/ipfs/bafkreicgv2fst4mt5q6sckgwz3pcktjkbtlcvtgcebbt6munq3akazi32i";

        vm.startBroadcast();
        ChocoCoin coin = new ChocoCoin();
        ChocoNft chocoNft = new ChocoNft(_tokenURIs, address(coin), 1);
        vm.stopBroadcast();
        return (chocoNft, coin);
    }
}
