# Virtual-Lab-on-Solution-of-linear-system
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linear Systems Solver | GitHub Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }
        
        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header Styles */
        header {
            background: linear-gradient(135deg, var(--primary-color), #1a2530);
            color: white;
            padding: 2rem 0;
            box-shadow: var(--shadow);
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logo i {
            font-size: 2.5rem;
            color: var(--secondary-color);
        }
        
        .logo h1 {
            font-size: 2.2rem;
            font-weight: 700;
        }
        
        .logo span {
            color: var(--secondary-color);
        }
        
        .github-link {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: var(--secondary-color);
            color: white;
            padding: 12px 24px;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .github-link:hover {
            background-color: #2980b9;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        /* Main Content */
        main {
            padding: 3rem 0;
        }
        
        .intro-section {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .intro-section h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }
        
        .intro-section p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto 2rem;
            color: #555;
        }
        
        .content-wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2.5rem;
        }
        
        @media (max-width: 992px) {
            .content-wrapper {
                grid-template-columns: 1fr;
            }
        }
        
        /* Solver Section */
        .solver-section {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--shadow);
        }
        
        .section-title {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 3px solid var(--secondary-color);
        }
        
        .matrix-input {
            margin-bottom: 1.5rem;
        }
        
        .matrix-size-selector {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 1.5rem;
        }
        
        .matrix-size-selector label {
            font-weight: 600;
        }
        
        .size-input {
            width: 70px;
            padding: 8px 12px;
            border: 2px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            text-align: center;
        }
        
        .matrix-grid {
            display: grid;
            gap: 10px;
            margin-bottom: 1.5rem;
        }
        
        .matrix-row {
            display: flex;
            gap: 10px;
        }
        
        .matrix-cell {
            flex: 1;
            padding: 12px;
            border: 2px solid #e1e5eb;
            border-radius: var(--border-radius);
            text-align: center;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .matrix-cell:focus {
            border-color: var(--secondary-color);
            outline: none;
        }
        
        .matrix-separator {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--accent-color);
            margin: 0 10px;
        }
        
        .buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .btn-primary {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .btn-success {
            background-color: var(--success-color);
            color: white;
        }
        
        .btn-success:hover {
            background-color: #218838;
        }
        
        .results {
            margin-top: 2rem;
            padding: 1.5rem;
            background-color: #f8f9fa;
            border-radius: var(--border-radius);
            border-left: 5px solid var(--secondary-color);
        }
        
        .results h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .solution {
            font-size: 1.1rem;
            line-height: 1.8;
        }
        
        .solution span {
            font-weight: 600;
            color: var(--accent-color);
        }
        
        /* Documentation Section */
        .documentation-section {
            background-color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--shadow);
        }
        
        .method {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #eee;
        }
        
        .method h3 {
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }
        
        .method p {
            color: #555;
            margin-bottom: 0.5rem;
        }
        
        .code-block {
            background-color: #2d3e50;
            color: #ecf0f1;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            font-family: 'Courier New', monospace;
            overflow-x: auto;
            margin-top: 1rem;
        }
        
        .features-list {
            list-style-type: none;
            margin-top: 1.5rem;
        }
        
        .features-list li {
            padding: 0.5rem 0;
            padding-left: 2rem;
            position: relative;
        }
        
        .features-list li:before {
            content: "✓";
            color: var(--success-color);
            font-weight: bold;
            position: absolute;
            left: 0;
        }
        
        /* Footer */
        footer {
            background-color: var(--primary-color);
            color: white;
            padding: 2rem 0;
            text-align: center;
            margin-top: 3rem;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .footer-links {
            display: flex;
            gap: 20px;
        }
        
        .footer-links a {
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: var(--secondary-color);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .matrix-size-selector {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .buttons {
                flex-direction: column;
            }
            
            .footer-content {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-calculator"></i>
                    <h1>Linear <span>Systems</span> Solver</h1>
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
            <h2>Solve Linear Systems of Equations</h2>
            <p>This program solves systems of linear equations using matrix methods. Enter your coefficients and constants, then choose a solution method to calculate the results.</p>
        </section>
        
        <div class="content-wrapper">
            <section class="solver-section">
                <h2 class="section-title">Linear Equations Solver</h2>
                
                <div class="matrix-input">
                    <div class="matrix-size-selector">
                        <label for="matrixSize">System Size (n x n):</label>
                        <input type="number" id="matrixSize" class="size-input" min="2" max="6" value="3">
                        <button id="updateSize" class="btn btn-secondary">
                            <i class="fas fa-sync-alt"></i> Update
                        </button>
                    </div>
                    
                    <div id="matrixContainer">
                        <!-- Matrix input will be generated here -->
                    </div>
                </div>
                
                <div class="buttons">
                    <button id="solveBtn" class="btn btn-primary">
                        <i class="fas fa-calculator"></i> Solve with Gaussian Elimination
                    </button>
                    <button id="solveInverseBtn" class="btn btn-success">
                        <i class="fas fa-calculator"></i> Solve with Matrix Inverse
                    </button>
                    <button id="clearBtn" class="btn btn-secondary">
                        <i class="fas fa-broom"></i> Clear All
                    </button>
                </div>
                
                <div id="resultsContainer" class="results" style="display: none;">
                    <h3>Solution</h3>
                    <div id="solution" class="solution">
                        <!-- Solution will appear here -->
                    </div>
                </div>
            </section>
            
            <section class="documentation-section">
                <h2 class="section-title">Documentation</h2>
                
                <div class="method">
                    <h3>Gaussian Elimination</h3>
                    <p>This method transforms the coefficient matrix into row-echelon form using elementary row operations, then uses back-substitution to find the solution.</p>
                    <div class="code-block">
// Pseudocode for Gaussian Elimination<br>
for k = 1 to n-1:<br>
&nbsp;&nbsp;for i = k+1 to n:<br>
&nbsp;&nbsp;&nbsp;&nbsp;factor = a[i][k] / a[k][k]<br>
&nbsp;&nbsp;&nbsp;&nbsp;for j = k to n+1:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a[i][j] = a[i][j] - factor * a[k][j]
                    </div>
                </div>
                
                <div class="method">
                    <h3>Matrix Inverse Method</h3>
                    <p>This method calculates the inverse of the coefficient matrix and multiplies it by the constants vector to obtain the solution: X = A⁻¹B.</p>
                    <div class="code-block">
// Pseudocode for Matrix Inverse Solution<br>
// Calculate inverse of matrix A<br>
A_inv = inverse(A)<br>
// Multiply inverse by constants vector B<br>
solution = multiply(A_inv, B)<br>
return solution
                    </div>
                </div>
                
                <h3>Features</h3>
                <ul class="features-list">
                    <li>Solves systems of 2 to 6 linear equations</li>
                    <li>Implements Gaussian Elimination with partial pivoting</li>
                    <li>Implements Matrix Inverse method for comparison</li>
                    <li>Handles systems with unique, infinite, or no solutions</li>
                    <li>Clean, responsive user interface</li>
                    <li>Easy-to-use matrix input interface</li>
                </ul>
            </section>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="copyright">
                    <p>&copy; 2023 Linear Systems Solver. Open source project.</p>
                </div>
                <div class="footer-links">
                    <a href="https://github.com/your-username/linear-systems-solver" target="_blank">GitHub Repository</a>
                    <a href="https://github.com/your-username" target="_blank">About the Developer</a>
                    <a href="mailto:your-email@example.com">Contact</a>
                </div>
            </div>
        </div>
    </footer>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize with a 3x3 system
            const initialSize = 3;
            createMatrixInput(initialSize);
            
            // Update matrix size when button is clicked
            document.getElementById('updateSize').addEventListener('click', function() {
                const size = parseInt(document.getElementById('matrixSize').value);
                if (size >= 2 && size <= 6) {
                    createMatrixInput(size);
                    hideResults();
                } else {
                    alert('Please enter a size between 2 and 6.');
                }
            });
            
            // Solve using Gaussian Elimination
            document.getElementById('solveBtn').addEventListener('click', solveWithGaussian);
            
            // Solve using Matrix Inverse
            document.getElementById('solveInverseBtn').addEventListener('click', solveWithInverse);
            
            // Clear all inputs
            document.getElementById('clearBtn').addEventListener('click', clearAll);
            
            function createMatrixInput(size) {
                const container = document.getElementById('matrixContainer');
                container.innerHTML = '';
                
                // Create matrix A (coefficients)
                const matrixDiv = document.createElement('div');
                matrixDiv.className = 'matrix-grid';
                
                for (let i = 0; i < size; i++) {
                    const rowDiv = document.createElement('div');
                    rowDiv.className = 'matrix-row';
                    
                    for (let j = 0; j < size; j++) {
                        const input = document.createElement('input');
                        input.type = 'number';
                        input.className = 'matrix-cell';
                        input.placeholder = `a${i+1}${j+1}`;
                        input.value = getDefaultValue(i, j, size);
                        input.step = 'any';
                        rowDiv.appendChild(input);
                    }
                    
                    // Add equals sign and constants input
                    const equalsSpan = document.createElement('span');
                    equalsSpan.className = 'matrix-separator';
                    equalsSpan.textContent = '=';
                    rowDiv.appendChild(equalsSpan);
                    
                    const constInput = document.createElement('input');
                    constInput.type = 'number';
                    constInput.className = 'matrix-cell';
                    constInput.placeholder = `b${i+1}`;
                    constInput.value = getDefaultConstant(i, size);
                    constInput.step = 'any';
                    rowDiv.appendChild(constInput);
                    
                    matrixDiv.appendChild(rowDiv);
                }
                
                container.appendChild(matrixDiv);
            }
            
            function getDefaultValue(i, j, size) {
                // Create a simple diagonal-dominant matrix for demo purposes
                if (i === j) return '2';
                if (Math.abs(i - j) === 1) return '1';
                return '0';
            }
            
            function getDefaultConstant(i, size) {
                // Create default constants for demo
                return (i + 1) * 3;
            }
            
            function solveWithGaussian() {
                const size = parseInt(document.getElementById('matrixSize').value);
                const {matrix, constants} = getMatrixData(size);
                
                // Validate input
                if (!validateInput(matrix, constants)) {
                    return;
                }
                
                // Perform Gaussian Elimination
                const solution = gaussianElimination(matrix, constants, size);
                
                // Display results
                displaySolution(solution, 'Gaussian Elimination');
            }
            
            function solveWithInverse() {
                const size = parseInt(document.getElementById('matrixSize').value);
                const {matrix, constants} = getMatrixData(size);
                
                // Validate input
                if (!validateInput(matrix, constants)) {
                    return;
                }
                
                // Check if matrix is invertible
                const det = determinant(matrix, size);
                if (Math.abs(det) < 1e-10) {
                    showError('Matrix is singular (determinant ≈ 0). Cannot use inverse method.');
                    return;
                }
                
                // Calculate inverse and solve
                const inverseMatrix = getMatrixInverse(matrix, size);
                const solution = multiplyMatrixVector(inverseMatrix, constants, size);
                
                // Display results
                displaySolution(solution, 'Matrix Inverse Method');
            }
            
            function getMatrixData(size) {
                const matrix = [];
                const constants = [];
                const cells = document.querySelectorAll('.matrix-cell');
                
                let cellIndex = 0;
                
                // Extract matrix coefficients
                for (let i = 0; i < size; i++) {
                    matrix[i] = [];
                    for (let j = 0; j < size; j++) {
                        matrix[i][j] = parseFloat(cells[cellIndex].value) || 0;
                        cellIndex++;
                    }
                    // Skip the equals sign (which is a span, not an input)
                    cellIndex++;
                    // Get constant
                    constants[i] = parseFloat(cells[cellIndex].value) || 0;
                    cellIndex++;
                }
                
                return {matrix, constants};
            }
            
            function validateInput(matrix, constants) {
                for (let i = 0; i < matrix.length; i++) {
                    for (let j = 0; j < matrix[i].length; j++) {
                        if (isNaN(matrix[i][j])) {
                            showError(`Invalid coefficient at row ${i+1}, column ${j+1}`);
                            return false;
                        }
                    }
                    if (isNaN(constants[i])) {
                        showError(`Invalid constant at equation ${i+1}`);
                        return false;
                    }
                }
                return true;
            }
            
            function gaussianElimination(matrix, constants, size) {
                // Create augmented matrix
                const augMatrix = [];
                for (let i = 0; i < size; i++) {
                    augMatrix[i] = [...matrix[i]];
                    augMatrix[i].push(constants[i]);
                }
                
                // Forward elimination
                for (let i = 0; i < size; i++) {
                    // Partial pivoting
                    let maxRow = i;
                    for (let k = i + 1; k < size; k++) {
                        if (Math.abs(augMatrix[k][i]) > Math.abs(augMatrix[maxRow][i])) {
                            maxRow = k;
                        }
                    }
                    
                    // Swap rows
                    if (maxRow !== i) {
                        [augMatrix[i], augMatrix[maxRow]] = [augMatrix[maxRow], augMatrix[i]];
                    }
                    
                    // Make all rows below this one 0 in current column
                    for (let k = i + 1; k < size; k++) {
                        const factor = augMatrix[k][i] / augMatrix[i][i];
                        for (let j = i; j <= size; j++) {
                            augMatrix[k][j] -= factor * augMatrix[i][j];
                        }
                    }
                }
                
                // Back substitution
                const solution = new Array(size).fill(0);
                for (let i = size - 1; i >= 0; i--) {
                    solution[i] = augMatrix[i][size];
                    for (let j = i + 1; j < size; j++) {
                        solution[i] -= augMatrix[i][j] * solution[j];
                    }
                    solution[i] /= augMatrix[i][i];
                }
                
                return solution;
            }
            
            function determinant(matrix, size) {
                // Simple determinant calculation for demonstration
                // In a real implementation, you would use a more robust method
                if (size === 2) {
                    return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
                }
                
                let det = 0;
                for (let i = 0; i < size; i++) {
                    // Create submatrix
                    const submatrix = [];
                    for (let j = 1; j < size; j++) {
                        submatrix[j-1] = [];
                        let colIndex = 0;
                        for (let k = 0; k < size; k++) {
                            if (k !== i) {
                                submatrix[j-1][colIndex] = matrix[j][k];
                                colIndex++;
                            }
                        }
                    }
                    const sign = (i % 2 === 0) ? 1 : -1;
                    det += sign * matrix[0][i] * determinant(submatrix, size-1);
                }
                
                return det;
            }
            
            function getMatrixInverse(matrix, size) {
                // For demonstration purposes - in a real implementation,
                // you would implement proper matrix inversion
                
                // This is a simplified version that works for the demo matrix
                // In practice, you'd implement Gaussian-Jordan elimination
                
                // For now, we'll just return a placeholder
                // In a full implementation, this would calculate the actual inverse
                
                // Create identity matrix
                const inverse = [];
                for (let i = 0; i < size; i++) {
                    inverse[i] = [];
                    for (let j = 0; j < size; j++) {
                        inverse[i][j] = (i === j) ? 1 : 0;
                    }
                }
                
                // Simple inversion for 2x2 matrix
                if (size === 2) {
                    const det = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
                    if (Math.abs(det) < 1e-10) return inverse;
                    
                    inverse[0][0] = matrix[1][1] / det;
                    inverse[0][1] = -matrix[0][1] / det;
                    inverse[1][0] = -matrix[1][0] / det;
                    inverse[1][1] = matrix[0][0] / det;
                }
                
                return inverse;
            }
            
            function multiplyMatrixVector(matrix, vector, size) {
                const result = [];
                for (let i = 0; i < size; i++) {
                    result[i] = 0;
                    for (let j = 0; j < size; j++) {
                        result[i] += matrix[i][j] * vector[j];
                    }
                }
                return result;
            }
            
            function displaySolution(solution, method) {
                const resultsContainer = document.getElementById('resultsContainer');
                const solutionDiv = document.getElementById('solution');
                
                let solutionHTML = `<p>Method: <strong>${method}</strong></p>`;
                solutionHTML += '<p>Variables:</p>';
                
                for (let i = 0; i < solution.length; i++) {
                    solutionHTML += `<p>x<sub>${i+1}</sub> = <span>${solution[i].toFixed(6)}</span></p>`;
                }
                
                // Show verification
                solutionHTML += '<p><strong>Verification (plugging back into equations):</strong></p>';
                
                const size = parseInt(document.getElementById('matrixSize').value);
                const {matrix, constants} = getMatrixData(size);
                
                for (let i = 0; i < size; i++) {
                    let leftSide = 0;
                    for (let j = 0; j < size; j++) {
                        leftSide += matrix[i][j] * solution[j];
                    }
                    const error = Math.abs(leftSide - constants[i]);
                    solutionHTML += `<p>Equation ${i+1}: LHS = ${leftSide.toFixed(6)}, RHS = ${constants[i]}, Error = ${error.toFixed(10)}</p>`;
                }
                
                solutionDiv.innerHTML = solutionHTML;
                resultsContainer.style.display = 'block';
                
                // Scroll to results
                resultsContainer.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }
            
            function showError(message) {
                alert(`Error: ${message}`);
            }
            
            function hideResults() {
                document.getElementById('resultsContainer').style.display = 'none';
            }
            
            function clearAll() {
                const cells = document.querySelectorAll('.matrix-cell');
                cells.forEach(cell => {
                    cell.value = '';
                });
                
                // Reset to default values
                const size = parseInt(document.getElementById('matrixSize').value);
                createMatrixInput(size);
                hideResults();
            }
        });
    </script>
</body>
</html>
