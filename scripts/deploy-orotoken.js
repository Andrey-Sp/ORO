const { ethers, defender, upgrades } = require("hardhat");

async function main() {
    console.log("Deploying OROTokenUpgradeable using OpenZeppelin Defender...");

    const OROTokenUpgradeable = await ethers.getContractFactory("OROTokenUpgradeable");

    // Define a unique salt (a random value to make the deployment deterministic)
    const salt = ethers.id("oro-deployment-unique-key");  // Generates a deterministic value

    // Deploy using Defender with salt
    const deployment = await defender.deployProxy(OROTokenUpgradeable, [], {
        initializer: "initialize",
        redeployImplementation: "always",
        salt: salt  // Add the required salt parameter
    });

    await deployment.waitForDeployment();

    console.log(`ORO Token deployed at: ${await deployment.getAddress()}`);
}

// Handle errors
main().catch((error) => {
    console.error("Deployment failed:", error);
    process.exitCode = 1;
});
