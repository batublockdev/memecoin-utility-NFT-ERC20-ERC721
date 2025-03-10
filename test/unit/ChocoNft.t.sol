// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import {ChocoNft} from "../../src/ChocoNft.sol";
import {DeployMoodNft} from "../../script/DeployNft.s.sol";
import {ChocoCoin} from "../../src/ChocoCoin.sol";
import {ERC20Mock} from "../mock/ERC20Mock.sol";
//import {MockFailedTransfer} from "../mock/MockFailedTransfer.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract DSCEngineTest is StdCheats, Test {
    string constant NFT_NAME = "ChocoNFT";
    string constant NFT_SYMBOL = "CHNFT";
    string constant COIN_NAME = "ChocoCoin";
    string constant COIN_SYMBOL = "CHCOIN";
    ChocoNft public choconft;
    ChocoCoin public chocoCoin;
    address public USER;
    address public USERX = makeAddr("player6");

    string public constant URI =
        "https://ipfs.io/ipfs/bafkreibkjh2aczdvn52l7377b6oawpik4upu7zxnnkhvy6p2myvc37u5mm";

    function setUp() external {
        DeployMoodNft deployer = new DeployMoodNft();
        (choconft, chocoCoin) = deployer.run();
    }

    function testInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(choconft.name())) ==
                keccak256(abi.encodePacked((NFT_NAME)))
        );
        assert(
            keccak256(abi.encodePacked(choconft.symbol())) ==
                keccak256(abi.encodePacked((NFT_SYMBOL)))
        );
        assert(
            keccak256(abi.encodePacked(chocoCoin.name())) ==
                keccak256(abi.encodePacked((COIN_NAME)))
        );
        assert(
            keccak256(abi.encodePacked(chocoCoin.symbol())) ==
                keccak256(abi.encodePacked((COIN_SYMBOL)))
        );
    }

    function testCanMintAndHaveABalance() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();

        assert(choconft.balanceOf(USER) == 1);
    }

    function testCanMint_error() public {
        vm.prank(USERX);
        vm.expectRevert(ChocoNft.ChocoNft_NotEnough_token_tomint.selector);
        choconft.mint();
    }

    function testCanMint_Uri() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();
        vm.prank(USER);
        assert(
            keccak256(abi.encodePacked(choconft.tokenURI(0))) ==
                keccak256(abi.encodePacked(URI))
        );
    }

    function testCanSell() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();
        vm.prank(USER); // sell
        choconft.listForSale(0, 100);
        assert(choconft.salePrices(0) == 100);
    }

    function testCanSell_Error_Nottheowner() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();
        vm.prank(USERX); // sell
        vm.expectRevert(ChocoNft.ChocoNft_Nottheowner.selector);
        choconft.listForSale(0, 100);
    }

    function testCanSell_Error_CantbeZero() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();
        vm.prank(USER); // sell
        vm.expectRevert(ChocoNft.ChocoNft_Price_cant_be_0.selector);
        choconft.listForSale(0, 0);
    }

    function testCanBuy() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();
        vm.prank(USER); // sell
        choconft.listForSale(0, 100);
        assert(choconft.salePrices(0) == 100);

        vm.prank(USER); // sell
        chocoCoin.transfer(USERX, 1000);

        vm.prank(USERX);
        chocoCoin.approve(address(choconft), 100);
        vm.prank(USERX); // buy
        choconft.buyNFT(0);
        assert(choconft.ownerOf(0) == USERX);
        assert(choconft.salePrices(0) == 0);
    }

    function testCanBuy_ChocoNft_NFT_NotForSale() public {
        USER = chocoCoin.getDeployer();
        vm.prank(USER);
        choconft.mint();

        vm.prank(USERX);
        chocoCoin.approve(address(choconft), 100);
        vm.prank(USERX); // buy
        vm.expectRevert(ChocoNft.ChocoNft_NFT_NotForSale.selector);
        choconft.buyNFT(0);
    }
}
