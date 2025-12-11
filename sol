<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linear Systems Solver | Interactive Demo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/11.7.0/math.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        :root {
            --primary-color: #2d3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --info-color: #17a2b8;
            --purple-color: #9b59b6;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --border-radius: 12px;
            --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --gradient-primary: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-secondary: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --gradient-dark: linear-gradient(135deg, #2d3e50 0%, #1a2530 100%);
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
            color: var(--dark-color);
            line-height: 1.6;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Animated Background Elements */
        .bg-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }
        
        .bg-element {
            position: absolute;
            border-radius: 50%;
            opacity: 0.1;
            animation: float 15s infinite linear;
        }
        
        .bg-1 {
            width: 300px;
            height: 300px;
            background: var(--secondary-color);
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }
        
        .bg-2 {
            width: 200px;
            height: 200px;
            background: var(--accent-color);
            top: 60%;
            right: 10%;
            animation-delay: 5s;
        }
        
        .bg-3 {
            width: 150px;
            height: 150px;
            background: var(--purple-color);
            bottom: 10%;
            left: 15%;
            animation-delay: 10s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            25% {
                transform: translateY(-20px) rotate(90deg);
            }
            50% {
                transform: translateY(0) rotate(180deg);
            }
            75% {
                transform: translateY(20px) rotate(270deg);
            }
        }
        
        /* Header Styles */
        header {
            background: var(--gradient-dark);
            color: white;
            padding: 2rem 0;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            position: relative;
            z-index: 2;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            animation: slideInLeft 1s ease-out;
        }
        
        .logo-icon {
            font-size: 3rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            filter: drop-shadow(0 4px 6px rgba(0,0,0,0.2));
        }
        
        .logo-text {
            display: flex;
            flex-direction: column;
        }
        
        .logo h1 {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(to right, #fff, #3498db);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .logo p {
            font-size: 1rem;
            opacity: 0.9;
        }
        
        .github-link {
            display: flex;
            align-items: center;
            gap: 10px;
            background: var(--gradient-primary);
            color: white;
            padding: 12px 24px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
            animation: slideInRight 1s ease-out;
        }
        
        .github-link:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 12px 25px rgba(102, 126, 234, 0.6);
        }
        
        /* Main Content */
        main {
            padding: 3rem 0;
        }
        
        .intro-section {
            text-align: center;
            margin-bottom: 4rem;
            animation: fadeIn 1.5s ease-out;
        }
        
        .intro-section h2 {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .intro-section p {
            font-size: 1.3rem;
            max-width: 800px;
            margin: 0 auto 2rem;
            color: #555;
            line-height: 1.8;
        }
        
        .interactive-demo {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            margin-bottom: 4rem;
        }
        
        @media (max-width: 1100px) {
            .interactive-demo {
                grid-template-columns: 1fr;
            }
        }
        
        /* Solver Card */
        .solver-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition);
            animation: slideUp 1s ease-out 0.3s both;
        }
        
        .solver-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        
        .section-title {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 3px solid var(--secondary-color);
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .section-title i {
            color: var(--secondary-color);
        }
        
        .matrix-input-section {
            margin-bottom: 2rem;
        }
        
        .matrix-size-controls {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 2rem;
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            border-left: 5px solid var(--secondary-color);
        }
        
        .size-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .size-control label {
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .size-input {
            width: 70px;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            text-align: center;
            transition: var(--transition);
            font-weight: 600;
        }
        
        .size-input:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }
        
        .matrix-input-area {
            position: relative;
            overflow: hidden;
            border-radius: var(--border-radius);
            background: white;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .matrix-grid {
            display: grid;
            gap: 15px;
            margin-bottom: 1.5rem;
            transition: var(--transition);
        }
        
        .matrix-row {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        
        .matrix-cell {
            flex: 1;
            padding: 16px;
            border: 2px solid #e1e5eb;
            border-radius: var(--border-radius);
            text-align: center;
            font-size: 1.1rem;
            transition: var(--transition);
            font-weight: 600;
            background: white;
        }
        
        .matrix-cell:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
            transform: scale(1.05);
        }
        
        .matrix-cell.highlight {
            background-color: rgba(52, 152, 219, 0.1);
            border-color: var(--secondary-color);
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0%, 100% {
                box-shadow: 0 0 0 0 rgba(52, 152, 219, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(52, 152, 219, 0);
            }
        }
        
        .matrix-separator {
            font-size: 2rem;
            font-weight: bold;
            color: var(--accent-color);
            margin: 0 15px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        /* Controls Section */
        .controls-section {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-bottom: 2rem;
        }
        
        @media (max-width: 768px) {
            .controls-section {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        .control-btn {
            padding: 16px;
            border: none;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .control-btn:hover {
            transform: translateY(-5px);
        }
        
        .btn-solve {
            background: var(--gradient-primary);
            color: white;
            grid-column: span 2;
        }
        
        .btn-solve:hover {
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-inverse {
            background: var(--gradient-secondary);
            color: white;
        }
        
        .btn-inverse:hover {
            box-shadow: 0 10px 20px rgba(245, 87, 108, 0.4);
        }
        
        .btn-clear {
            background: #6c757d;
            color: white;
        }
        
        .btn-clear:hover {
            background: #5a6268;
            box-shadow: 0 10px 20px rgba(108, 117, 125, 0.4);
        }
        
        .btn-random {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .btn-random:hover {
            box-shadow: 0 10px 20px rgba(245, 87, 108, 0.4);
        }
        
        .btn-preset {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }
        
        .btn-preset:hover {
            box-shadow: 0 10px 20px rgba(79, 172, 254, 0.4);
        }
        
        /* Results Section */
        .results-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition);
            animation: slideUp 1s ease-out 0.6s both;
        }
        
        .results-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #eee;
        }
        
        .solution-container {
            min-height: 200px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .solution-item {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            border-left: 5px solid var(--success-color);
            transition: var(--transition);
        }
        
        .solution-item:hover {
            transform: translateX(10px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .variable {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: var(--gradient-primary);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
            margin-right: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .solution-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .solution-method {
            font-size: 0.9rem;
            color: #6c757d;
            font-style: italic;
        }
        
        .verification-results {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            margin-top: 1.5rem;
        }
        
        .verification-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        /* Visualization Section */
        .visualization-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            padding: 2.5rem;
            box-shadow: var(--shadow);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-top: 3rem;
            animation: slideUp 1s ease-out 0.9s both;
        }
        
        .chart-container {
            height: 300px;
            margin-top: 2rem;
            position: relative;
        }
        
        /* Tabs */
        .tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 2rem;
            border-bottom: 2px solid #eee;
            padding-bottom: 1rem;
        }
        
        .tab {
            padding: 12px 24px;
            background: #f8f9fa;
            border: none;
            border-radius: var(--border-radius);
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .tab.active {
            background: var(--gradient-primary);
            color: white;
            box-shadow: 0 4px 6px rgba(102, 126, 234, 0.3);
        }
        
        .tab-content {
            display: none;
        }
        
        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s ease-out;
        }
        
        /* Method Info Cards */
        .method-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 2rem;
        }
        
        .method-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: var(--transition);
            border-top: 5px solid var(--secondary-color);
        }
        
        .method-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .method-card h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .method-card p {
            color: #666;
            line-height: 1.7;
        }
        
        .complexity {
            display: inline-block;
            padding: 5px 15px;
            background: #f8f9fa;
            border-radius: 50px;
            font-size: 0.9rem;
            margin-top: 15px;
            color: var(--primary-color);
        }
        
        /* Footer */
        footer {
            background: var(--gradient-dark);
            color: white;
            padding: 3rem 0;
            margin-top: 4rem;
            position: relative;
            overflow: hidden;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
        }
        
        .footer-logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .footer-logo i {
            font-size: 2.5rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .footer-links {
            display: flex;
            gap: 25px;
        }
        
        .footer-links a {
            color: #ddd;
            text-decoration: none;
            transition: var(--transition);
            padding: 8px 0;
            position: relative;
        }
        
        .footer-links a:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--secondary-color);
            transition: var(--transition);
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .footer-links a:hover:after {
            width: 100%;
        }
        
        /* Animations */
        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 25px;
                text-align: center;
            }
            
            .controls-section {
                grid-template-columns: 1fr;
            }
            
            .btn-solve {
                grid-column: span 1;
            }
            
            .matrix-size-controls {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .footer-content {
                flex-direction: column;
                text-align: center;
            }
            
            .footer-links {
                flex-direction: column;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Background Elements -->
    <div class="bg-elements">
        <div class="bg-element bg-1"></div>
        <div class="bg-element bg-2"></div>
        <div class="bg-element bg-3"></div>
    </div>
    
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-calculator logo-icon"></i>
                    <div class="logo-text">
                        <h1>Linear Systems <span>Solver</span></h1>
                        <p>Interactive matrix calculator with visualization</p>
                    </div>
                </div>
                <a href="https://github.com/your-username/linear-systems-solver" class="github-link" target="_blank">
                    <i class="fab fa-github"></i>
                    View on GitHub
                </a>
            </div>
        </div>
    </header>
    
    <main class="container">
        <section class="intro-section">
            <h2>Interactive Linear Systems Solver</h2>
            <p>Solve systems of linear equations with an interactive interface, real-time visualization, and multiple solution methods. Experience mathematics in action!</p>
        </section>
        
        <div class="interactive-demo">
            <section class="solver-card">
                <h2 class="section-title"><i class="fas fa-sliders-h"></i> Interactive Solver</h2>
                
                <div class="matrix-input-section">
                    <div class="matrix-size-controls">
                        <div class="size-control">
                            <label for="matrixSize">Matrix Size:</label>
                            <input type="range" id="matrixSize" class="size-input" min="2" max="6" value="3" step="1">
                            <span id="sizeValue" class="size-value">3×3</span>
                        </div>
                        
                        <div class="size-control">
                            <label for="precision">Precision:</label>
                            <select id="precision" class="size-input">
                                <option value="2">2 decimals</option>
                                <option value="4" selected>4 decimals</option>
                                <option value="6">6 decimals</option>
                                <option value="8">8 decimals</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="matrix-input-area">
                        <div id="matrixContainer" class="matrix-grid">
                            <!-- Matrix input will be generated here -->
                        </div>
                        <div class="equation-preview" id="equationPreview">
                            <!-- Equation preview will be generated here -->
                        </div>
                    </div>
                </div>
                
                <div class="controls-section">
                    <button id="solveBtn" class="control-btn btn-solve">
                        <i class="fas fa-bolt"></i> Solve (Gaussian)
                    </button>
                    <button id="solveInverseBtn" class="control-btn btn-inverse">
                        <i class="fas fa-project-diagram"></i> Matrix Inverse
                    </button>
                    <button id="randomBtn" class="control-btn btn-random">
                        <i class="fas fa-dice"></i> Random System
                    </button>
                    <button id="presetBtn" class="control-btn btn-preset">
                        <i class="fas fa-star"></i> Example System
                    </button>
                    <button id="clearBtn" class="control-btn btn-clear">
                        <i class="fas fa-eraser"></i> Clear All
                    </button>
                    <button id="animateBtn" class="control-btn" style="background:linear-gradient(135deg, #f6d365 0%, #fda085 100%); color:white;">
                        <i class="fas fa-play"></i> Animate Solution
                    </button>
                </div>
                
                <div class="tabs">
                    <button class="tab active" data-tab="solution">Solution</button>
                    <button class="tab" data-tab="steps">Solution Steps</button>
                    <button class="tab" data-tab="matrix">Matrix Details</button>
                </div>
                
                <div class="tab-content active" id="solutionTab">
                    <div class="solution-container" id="solutionContainer">
                        <div class="solution-placeholder">
                            <p style="text-align: center; color: #999; font-style: italic;">
                                <i class="fas fa-calculator" style="font-size: 3rem; margin-bottom: 1rem; display: block;"></i>
                                Enter your system of equations and click "Solve" to see the solution here.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="tab-content" id="stepsTab">
                    <div id="stepsContainer">
                        <p style="text-align: center; color: #999; font-style: italic;">
                            Solution steps will appear here after solving.
                        </p>
                    </div>
                </div>
                
                <div class="tab-content" id="matrixTab">
                    <div id="matrixDetails">
                        <p style="text-align: center; color: #999; font-style: italic;">
                            Matrix details will appear here after solving.
                        </p>
                    </div>
                </div>
            </section>
            
            <section class="results-card">
                <div class="results-header">
                    <h2 class="section-title"><i class="fas fa-chart-line"></i> Visualization</h2>
                    <div class="viz-controls">
                        <select id="vizType" class="size-input">
                            <option value="2d">2D Graph (for 2 variables)</option>
                            <option value="3d">3D Surface (for 3 variables)</option>
                            <option value="error">Error Analysis</option>
                        </select>
                    </div>
                </div>
                
                <div class="chart-container">
                    <canvas id="solutionChart"></canvas>
                </div>
                
                <div class="verification-results" id="verificationResults">
                    <h3><i class="fas fa-check-circle"></i> Verification</h3>
                    <p style="color: #999; font-style: italic; margin-top: 10px;">
                        Solution verification will appear here after solving.
                    </p>
                </div>
            </section>
        </div>
        
        <section class="visualization-section">
            <h2 class="section-title"><i class="fas fa-cogs"></i> Solution Methods</h2>
            
            <div class="method-cards">
                <div class="method-card">
                    <h3><i class="fas fa-sort-amount-down" style="color:#3498db"></i> Gaussian Elimination</h3>
                    <p>Transforms the coefficient matrix into row-echelon form using elementary row operations, then uses back-substitution to find the solution.</p>
                    <div class="complexity">Time Complexity: O(n³)</div>
                </div>
                
                <div class="method-card">
                    <h3><i class="fas fa-exchange-alt" style="color:#e74c3c"></i> Gauss-Jordan Elimination</h3>
                    <p>An extension of Gaussian elimination that reduces the matrix to reduced row-echelon form (RREF) directly yielding the solution.</p>
                    <div class="complexity">Time Complexity: O(n³)</div>
                </div>
                
                <div class="method-card">
                    <h3><i class="fas fa-project-diagram" style="color:#9b59b6"></i> Matrix Inverse Method</h3>
                    <p>Calculates the inverse of the coefficient matrix and multiplies it by the constants vector: X = A⁻¹B.</p>
                    <div class="complexity">Time Complexity: O(n³)</div>
                </div>
                
                <div class="method-card">
                    <h3><i class="fas fa-undo" style="color:#2ecc71"></i> LU Decomposition</h3>
                    <p>Factorizes the matrix into lower (L) and upper (U) triangular matrices, then solves through forward and backward substitution.</p>
                    <div class="complexity">Time Complexity: O(n³)</div>
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-logo">
                    <i class="fas fa-calculator"></i>
                    <div>
                        <h3>Linear Systems Solver</h3>
                        <p>Open Source Mathematics Tool</p>
                    </div>
                </div>
                
                <div class="footer-links">
                    <a href="https://github.com/your-username/linear-systems-solver" target="_blank">GitHub Repository</a>
                    <a href="#" id="documentationLink">Documentation</a>
                    <a href="#" id="aboutLink">About</a>
                    <a href="mailto:your-email@example.com">Contact</a>
                </div>
            </div>
            
            <div style="text-align: center; margin-top: 2rem; opacity: 0.7; font-size: 0.9rem;">
                <p>Made with <i class="fas fa-heart" style="color:#e74c3c"></i> for the mathematics community</p>
            </div>
        </div>
    </footer>
    
    <!-- Modal for Documentation -->
    <div id="documentationModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.8); z-index:1000; justify-content:center; align-items:center;">
        <div style="background:white; padding:3rem; border-radius:var(--border-radius); max-width:800px; max-height:80vh; overflow-y:auto; position:relative;">
            <button id="closeModal" style="position:absolute; top:20px; right:20px; background:none; border:none; font-size:2rem; cursor:pointer; color:#666;">&times;</button>
            <h2>Documentation</h2>
            <p>This interactive linear systems solver supports solving systems of 2-6 equations with 2-6 variables.</p>
            <h3>Features:</h3>
            <ul>
                <li><strong>Multiple Solution Methods:</strong> Gaussian Elimination, Matrix Inverse, and more</li>
                <li><strong>Interactive Input:</strong> Click and edit matrix values directly</li>
                <li><strong>Visualization:</strong> 2D and 3D graphical representations of solutions</li>
                <li><strong>Step-by-step Solution:</strong> See detailed solution process</li>
                <li><strong>Error Analysis:</strong> Verification of solution accuracy</li>
            </ul>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize variables
            let currentSize = 3;
            let solutionChart = null;
            let solutionSteps = [];
            let isAnimating = false;
            
            // DOM Elements
            const matrixSizeInput = document.getElementById('matrixSize');
            const sizeValueSpan = document.getElementById('sizeValue');
            const matrixContainer = document.getElementById('matrixContainer');
            const equationPreview = document.getElementById('equationPreview');
            const solutionContainer = document.getElementById('solutionContainer');
            const stepsContainer = document.getElementById('stepsContainer');
            const matrixDetails = document.getElementById('matrixDetails');
            const verificationResults = document.getElementById('verificationResults');
            const precisionSelect = document.getElementById('precision');
            const vizTypeSelect = document.getElementById('vizType');
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');
            
            // Initialize
            updateSizeDisplay();
            createMatrixInput(currentSize);
            initializeChart();
            
            // Event Listeners
            matrixSizeInput.addEventListener('input', function() {
                currentSize = parseInt(this.value);
                updateSizeDisplay();
                createMatrixInput(currentSize);
                clearResults();
            });
            
            document.getElementById('solveBtn').addEventListener('click', solveWithGaussian);
            document.getElementById('solveInverseBtn').addEventListener('click', solveWithInverse);
            document.getElementById('randomBtn').addEventListener('click', generateRandomSystem);
            document.getElementById('presetBtn').addEventListener('click', loadPresetSystem);
            document.getElementById('clearBtn').addEventListener('click', clearAll);
            document.getElementById('animateBtn').addEventListener('click', animateSolution);
            
            precisionSelect.addEventListener('change', updateSolutionDisplay);
            vizTypeSelect.addEventListener('change', updateVisualization);
            
            // Tab switching
            tabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    const tabId = this.getAttribute('data-tab');
                    
                    // Update active tab
                    tabs.forEach(t => t.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Show active content
                    tabContents.forEach(content => {
                        content.classList.remove('active');
                        if (content.id === tabId + 'Tab') {
                            content.classList.add('active');
                        }
                    });
                });
            });
            
            // Modal functionality
            document.getElementById('documentationLink').addEventListener('click', function(e) {
                e.preventDefault();
                document.getElementById('documentationModal').style.display = 'flex';
            });
            
            document.getElementById('aboutLink').addEventListener('click', function(e) {
                e.preventDefault();
                alert('Linear Systems Solver v2.0\nAn interactive tool for solving systems of linear equations.\nCreated for educational purposes.');
            });
            
            document.getElementById('closeModal').addEventListener('click', function() {
                document.getElementById('documentationModal').style.display = 'none';
            });
            
            // Functions
            function updateSizeDisplay() {
                sizeValueSpan.textContent = `${currentSize}×${currentSize}`;
            }
            
            function createMatrixInput(size) {
                matrixContainer.innerHTML = '';
                equationPreview.innerHTML = '';
                
                //
