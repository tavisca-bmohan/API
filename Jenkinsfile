pipeline 
{ 
	agent any 
	stages 
	{ 
		
		stage('Build') 
		{ 
			steps 
			{ 
		 		sh 'dotnet build API.sln -p:Configration=release -v:n' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				sh 'dotnet test'
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				sh 'dotnet publish -c Release'
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{
                		sh 'compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update'
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		sh 'expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force'
            		}
        	}	
	} 
	
}
