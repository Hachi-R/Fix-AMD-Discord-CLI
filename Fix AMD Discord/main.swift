//
//  main.swift
//  Fix AMD Discord
//
//  Created by Rodrigo Borges on 16/02/24.
//

import Foundation

main()

func main() {
    // clear the terminal
    // limpa o terminal
    clearTerminal()
    
    // // check if the system is fixed and update the status in start text.
    // verifica se o sistema está concertado e altera o status no texto de inicio
    if getEnvVar() == "5" {
        initFixed()
    } else {initUnfixed()}
    
    // get the user intention and redirect to desired function.
    // obtem a intenção do usuario e redireciona para a função desejada
    let option: String = input()
    inputHandler(input: option)
    
}

private func input() -> String {
    print("# Choose one of the options above: ", terminator: "")
    if let input = readLine() {
        return input
    } else {
        return "No input provided"
    }
}

private func getEnvVar() -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/sh")
    process.arguments = ["-c", "launchctl getenv MKL_DEBUG_CPU_TYPE"]
    
    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    
    do {
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus !=  0 {
            print("Error: command execution failed with status \(process.terminationStatus)")
            print("Contact truehachi on discord")
        } else {
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            if let outputString = String(data: outputData, encoding: .utf8) {
                return outputString.trimmingCharacters(in: .newlines)
            } else {
                print("Error: could not convert process output to String")
                print("Contact truehachi on discord")
            }
        }
    } catch {
        print("Error running command: \(error)")
        print("Contact truehachi on discord")
    }
    
    return "Error getting env var, contact truehachi on discord"
}

private func addPlist() {
    let plistContent = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST  1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>mkl-debug</string>
        <key>ProgramArguments</key>
        <array>
            <string>sh</string>
            <string>-c</string>
            <string>launchctl setenv MKL_DEBUG_CPU_TYPE  5</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
    </plist>
    """

    let homeDirectory = FileManager.default.homeDirectoryForCurrentUser
    let launchAgentsDirectory = homeDirectory.appendingPathComponent("Library/LaunchAgents")
    let plistURL = launchAgentsDirectory.appendingPathComponent("fixAMDdiscord.plist")

    if !FileManager.default.fileExists(atPath: launchAgentsDirectory.path) {
        do {
            try FileManager.default.createDirectory(at: launchAgentsDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("failed to create LaunchAgents directory: \(error)")
            return
        }
    }

    do {
        try plistContent.write(to: plistURL, atomically: true, encoding: .utf8)
    } catch {
        print("failed to write .plist file: \(error)")
    }
}

private func removePlist() {
    let homeDirectory = FileManager.default.homeDirectoryForCurrentUser
    let launchAgentsDirectory = homeDirectory.appendingPathComponent("Library/LaunchAgents")
    let plistURL = launchAgentsDirectory.appendingPathComponent("fixAMDdiscord.plist")

    if FileManager.default.fileExists(atPath: plistURL.path) {
        do {
            try FileManager.default.removeItem(at: plistURL)
        } catch {
            print("failed to delete .plist file: \(error)")
        }
    }
}

private func setEnvVar() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/sh")
    process.arguments = ["-c", "launchctl setenv MKL_DEBUG_CPU_TYPE  5"]
    
    do {
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus !=  0 {
            print("error: command execution failed with status \(process.terminationStatus)")
            print("contact truehachi on discord")
        }
    } catch {
        print("Error running command: \(error)")
        print("contact truehachi on discord")
    }
}

private func unsetEnvVar() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/sh")
    process.arguments = ["-c", "launchctl unsetenv MKL_DEBUG_CPU_TYPE"]
    
    do {
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus !=  0 {
            print("error: command execution failed with status \(process.terminationStatus)")
            print("contact truehachi on discord")
        }
    } catch {
        print("Error running command: \(error)")
        print("contact truehachi on discord")
    }
}

func clearTerminal() {
    let process = Process()
    process.launchPath = "/usr/bin/env"
    process.arguments = ["clear"]
    process.launch()
    process.waitUntilExit()
}

private func inputHandler(input: String) {
    switch input.lowercased() {
    case "1":
        addPlist()
        setEnvVar()
        main()
    case "2":
        removePlist()
        unsetEnvVar()
        main()
    case "3":
        setEnvVar()
        main()
    case "4":
        unsetEnvVar()
        main()
    case "5":
        addPlist()
        main()
    case "6":
        removePlist()
        main()
    case "h":
        help()
        if (readLine() != nil) {
            main()
        }
    case "c":
        contact()
        main()
        
    case "g":
        gui()
        main()
    default:
        print("Invalid option")
        main()
    }
}

private func gui() {
    let urlString = "https://github.com/Hachi-R/FixAMDDiscord"
    let process = Process()
    process.launchPath = "/usr/bin/open"
    process.arguments = [urlString]
    process.launch()
}

func contact() {
    let urlString = "https://discordapp.com/users/794234392141627432"
    let process = Process()
    process.launchPath = "/usr/bin/open"
    process.arguments = [urlString]
    process.launch()
}

private func help() {
    clearTerminal()
    print(
        """
            EN:
            1. Apply a permanent correction, which will remain active until it is explicitly removed.
            
            2. Remove a previously applied correction, reverting to the original state, and this change will remain even after restarting the system.
            
            3. Apply a temporary correction, which will be reverted after restarting the system.
            
            4. Temporarily remove the correction, which will be reapplied after the next system restart.
            
            5. Apply a correction that will only take effect after the system is restarted.
            
            6. Remove the correction only after the system restart.
        
            PT-BR:
            1. Aplica uma correção permanente, que permanecerá ativa até que seja explicitamente removida.

            2. Remove uma correção aplicada anteriormente, revertendo para o estado original, e essa mudança permanecerá mesmo após reinicar o sistema.

            3. Aplica uma correção temporária, que será revertida após reiniciar o sistema.

            4. Remove a correção temporáriamente, que será reaplicada após o próximo reinício de sistema.

            5. Aplica uma correção que só entrará em vigor após o sistema ser reiniciado.

            6. Remove a correção apenas após o reinício do sistema.
        """
    )
}

private func initFixed() {
    print(
        " ###################################################\n",
        "#               Fix AMD Discord CLI               #\n",
        "#                  Status: Fixed                  #\n",
        "###################################################\n\n",
        
        "1. Permanent fix\n",
        "2. Permanent unfix\n\n",
        
        "3. Fix until the next restart\n",
        "4. Unfix until the next restart\n",
        "5. Fix after restart\n",
        "6. Unfix after restart\n\n",
        
        "H. Help\n",
        "C. Contact\n",
        "G. GUI version\n"
    )
}

private func initUnfixed() {
    print(
        " ###################################################\n",
        "#               Fix AMD Discord CLI               #\n",
        "#                 Status: Unfixed                 #\n",
        "###################################################\n\n",
        
        "1. Permanent fix\n",
        "2. Permanent unfix\n\n",
        
        "3. Fix until the next restart\n",
        "4. Unfix until the next restart\n",
        "5. Fix after restart\n",
        "6. Unfix after restart\n\n",
        
        "H. Help\n",
        "C. Contact\n",
        "G. GUI version\n"
    )
}
