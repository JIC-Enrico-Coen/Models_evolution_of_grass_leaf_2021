function [m,result] = gpt_volumetric_models_of_leaf_primordium_emergence_20211006( m, varargin )
%[m,result] = gpt_volumetric_models_of_leaf_primordium_emergence_20211006( m, varargin )
%   Morphogen interaction function.
%   Written at 2021-10-06 15:13:59.
%   GFtbox revision 20210803, 2020-08-03 15:00.

% The user may edit any part of this function lying between lines that
% begin "%%% USER CODE" and "%%% END OF USER CODE".  Those lines themselves
% delimiters themselves must not be moved, edited, deleted, or added.

    result = [];
    if isempty(m), return; end

    setGlobals();
    
    % Handle new-style callbacks.
    if nargin > 1
        if exist('ifCallbackHandler','file')==2
            [m,result] = ifCallbackHandler( m, varargin{:} );
        end
        return;
    end

    fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

    realtime = m.globalDynamicProps.currenttime;
    dt = m.globalProps.timestep;

%%% USER CODE: INITIALISATION
    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.
%%%% THESE ARE MODELS OF LEAF INITIATION FROM A DOME-SHAPED APEX
%%%% CORRESPONDING TO MAIN TEXT FIGURES 2 & 4 AND SUPPLEMNTARY FIGURES S1 &
%%%% S2 OF THE MANUSCRIPT "EVOLUTION OF THE GRASS LEAF BY PRIMOROIDUM
%%%% EXTENSION AND PETIOLE-LAMINA REMODELING" (RICHARDSON, ET AL, SCIENCE 2021)
        if m.globalProps.IFsetsoptions
            m = setUpModelOptions( m, ...   % morphospace of ventral/dorsal and blade/stalk
                'modelname', {'MODEL1',...  % "Ring Model", single othoplanar polairty field, with high specified Kper equal around ring  (Fig.2C to D)
                              'MODEL2',...  % Abaxial/adaxial mutant (Fig.J to K)
                              'MODEL3',... % Wildtype Eudicot leaf(Fig.4C to D)
                              'MODEL4',... % Eudicot prs mutant (Fig.4E to F)
                              'MODEL5',... % Eudicot prs wox 1 mutant (Fig.4G to H)
                              'MODEL6',... % Wildtype grasss leaf (Fig.2I to L)
                              'MODEL7',... % Maize narrowsheath mutant (Fig.2P to Q)
                              'MODEL8',... % "Sloping primordium model". A single othoplanar polarity field with high specified growth rates perpendicular to the polarity in the primordium zone (PZ) and the apex. Within the PZ growth rates decline from the midpoint. (Fig2.E to F)
                             }, 'MODEL3' ... % Model version name that is run.
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
        subdivlength_i = getMgenLevels( m, 'SUBDIVLENGTH' );
        didsplit = true;
        MAXATTEMPTS = 5;
        numattempts = 0;
        while didsplit && (numattempts < MAXATTEMPTS)
            [m,didsplit] = trysplit( m );
            numattempts = numattempts+1;
        end
        
        MAKESECONDLAYER = false;
        if MAKESECONDLAYER
            % setup latitudinal and longitudinal grid
            m = leaf_makesecondlayer( m, 'mode', 'latlong', 'hemisphere', 'n',...  
                                         'subdivisions', 40,...
                                         'divisions', [16 8],...
                                         'add', true );
        end
                                 
        % setup the arrow color of second polarity                         
        m = leaf_plotoptions( m, 'bioAalpha', 0,...                          
                                 'highgradcolor2', [0, 0, 0.9],...  % Was 0.9, 0.1, 0.1       
                                 'lowgradcolor2',[0, 0, 0.9],...  % Was 0.9, 0.1, 0.1   
                                 'arrowthickness', 2 );
        m = leaf_setmorphogenrole( m, 'EDGESPLIT', 'SUBDIVLENGTH' );
        m = leaf_setmorphogenrole( m, 'SUBDIVISIONLENGTH', '' );
    end
    
    OPTIONS = getModelOptions( m );
    printModelOptions( m );
    m = leaf_setproperty( m, 'surfacetension', 0.0625 );
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

% Each call of getMgenLevels below returns four results:
% XXX_i is the index of the morphogen called XXX.
% XXX_p is the vector of all of its values.
% XXX_a is its mutation level.
% XXX_l is the "effective" level of the morphogen, i.e. XXX_p*XXX_a.
% In SECTION 3 of the automatically generated code, all of the XXX_p values
% will be copied back into the mesh.

    [kpar_i,kpar_p,kpar_a,kpar_l] = getMgenLevels( m, 'KPAR' );  %#ok<ASGLU>
    [kpar2_i,kpar2_p,kpar2_a,kpar2_l] = getMgenLevels( m, 'KPAR2' );  %#ok<ASGLU>
    [kper_i,kper_p,kper_a,kper_l] = getMgenLevels( m, 'KPER' );  %#ok<ASGLU>
    [pol_i,pol_p,pol_a,pol_l] = getMgenLevels( m, 'POL' );  %#ok<ASGLU>
    [pol2_i,pol2_p,pol2_a,pol2_l] = getMgenLevels( m, 'POL2' );  %#ok<ASGLU>
    [id_adaxial_i,id_adaxial_p,id_adaxial_a,id_adaxial_l] = getMgenLevels( m, 'ID_ADAXIAL' );  %#ok<ASGLU>
    [id_abaxial_i,id_abaxial_p,id_abaxial_a,id_abaxial_l] = getMgenLevels( m, 'ID_ABAXIAL' );  %#ok<ASGLU>
    [id_prox_i,id_prox_p,id_prox_a,id_prox_l] = getMgenLevels( m, 'ID_PROX' );  %#ok<ASGLU>
    [id_dist_i,id_dist_p,id_dist_a,id_dist_l] = getMgenLevels( m, 'ID_DIST' );  %#ok<ASGLU>
    [id_midplane_i,id_midplane_p,id_midplane_a,id_midplane_l] = getMgenLevels( m, 'ID_MIDPLANE' );  %#ok<ASGLU>
    [id_surface_i,id_surface_p,id_surface_a,id_surface_l] = getMgenLevels( m, 'ID_SURFACE' );  %#ok<ASGLU>
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_meristem_i,id_meristem_p,id_meristem_a,id_meristem_l] = getMgenLevels( m, 'ID_MERISTEM' );  %#ok<ASGLU>
    [id_blade_i,id_blade_p,id_blade_a,id_blade_l] = getMgenLevels( m, 'ID_BLADE' );  %#ok<ASGLU>
    [s_adaxial_i,s_adaxial_p,s_adaxial_a,s_adaxial_l] = getMgenLevels( m, 'S_ADAXIAL' );  %#ok<ASGLU>
    [s_abaxial_i,s_abaxial_p,s_abaxial_a,s_abaxial_l] = getMgenLevels( m, 'S_ABAXIAL' );  %#ok<ASGLU>
    [v_radii_i,v_radii_p,v_radii_a,v_radii_l] = getMgenLevels( m, 'V_RADII' );  %#ok<ASGLU>
    [v_dist_i,v_dist_p,v_dist_a,v_dist_l] = getMgenLevels( m, 'V_DIST' );  %#ok<ASGLU>
    [v_center_i,v_center_p,v_center_a,v_center_l] = getMgenLevels( m, 'V_CENTER' );  %#ok<ASGLU>
    [id_mid_i,id_mid_p,id_mid_a,id_mid_l] = getMgenLevels( m, 'ID_MID' );  %#ok<ASGLU>
    [id_edge_i,id_edge_p,id_edge_a,id_edge_l] = getMgenLevels( m, 'ID_EDGE' );  %#ok<ASGLU>
    [id_pzmargin_i,id_pzmargin_p,id_pzmargin_a,id_pzmargin_l] = getMgenLevels( m, 'ID_PZMARGIN' );  %#ok<ASGLU>
    [s_mid_i,s_mid_p,s_mid_a,s_mid_l] = getMgenLevels( m, 'S_MID' );  %#ok<ASGLU>
    [s_edge_i,s_edge_p,s_edge_a,s_edge_l] = getMgenLevels( m, 'S_EDGE' );  %#ok<ASGLU>
    [s_pzmargin_i,s_pzmargin_p,s_pzmargin_a,s_pzmargin_l] = getMgenLevels( m, 'S_PZMARGIN' );  %#ok<ASGLU>
    [id_pz_i,id_pz_p,id_pz_a,id_pz_l] = getMgenLevels( m, 'ID_PZ' );  %#ok<ASGLU>
    [id_boundary_i,id_boundary_p,id_boundary_a,id_boundary_l] = getMgenLevels( m, 'ID_BOUNDARY' );  %#ok<ASGLU>
    [id_midpoint_i,id_midpoint_p,id_midpoint_a,id_midpoint_l] = getMgenLevels( m, 'ID_MIDPOINT' );  %#ok<ASGLU>
    [id_central_i,id_central_p,id_central_a,id_central_l] = getMgenLevels( m, 'ID_CENTRAL' );  %#ok<ASGLU>
    [id_lateral_i,id_lateral_p,id_lateral_a,id_lateral_l] = getMgenLevels( m, 'ID_LATERAL' );  %#ok<ASGLU>
    [id_marginal_i,id_marginal_p,id_marginal_a,id_marginal_l] = getMgenLevels( m, 'ID_MARGINAL' );  %#ok<ASGLU>
    [id_core_i,id_core_p,id_core_a,id_core_l] = getMgenLevels( m, 'ID_CORE' );  %#ok<ASGLU>
    [id_apex_i,id_apex_p,id_apex_a,id_apex_l] = getMgenLevels( m, 'ID_APEX' );  %#ok<ASGLU>
    [id_boundary1_i,id_boundary1_p,id_boundary1_a,id_boundary1_l] = getMgenLevels( m, 'ID_BOUNDARY1' );  %#ok<ASGLU>
    [id_boundary2_i,id_boundary2_p,id_boundary2_a,id_boundary2_l] = getMgenLevels( m, 'ID_BOUNDARY2' );  %#ok<ASGLU>
    [id_axial_i,id_axial_p,id_axial_a,id_axial_l] = getMgenLevels( m, 'ID_AXIAL' );  %#ok<ASGLU>
    [id_cz_i,id_cz_p,id_cz_a,id_cz_l] = getMgenLevels( m, 'ID_CZ' );  %#ok<ASGLU>
    [s_prox_i,s_prox_p,s_prox_a,s_prox_l] = getMgenLevels( m, 'S_PROX' );  %#ok<ASGLU>
    [s_boundpz_i,s_boundpz_p,s_boundpz_a,s_boundpz_l] = getMgenLevels( m, 'S_BOUNDPZ' );  %#ok<ASGLU>
    [id_boundpz_i,id_boundpz_p,id_boundpz_a,id_boundpz_l] = getMgenLevels( m, 'ID_BOUNDPZ' );  %#ok<ASGLU>
    [s_midplane_i,s_midplane_p,s_midplane_a,s_midplane_l] = getMgenLevels( m, 'S_MIDPLANE' );  %#ok<ASGLU>
    [subdivlength_i,subdivlength_p,subdivlength_a,subdivlength_l] = getMgenLevels( m, 'SUBDIVLENGTH' );  %#ok<ASGLU>
    [id_stipule_i,id_stipule_p,id_stipule_a,id_stipule_l] = getMgenLevels( m, 'ID_STIPULE' );  %#ok<ASGLU>
    [id_stbound_i,id_stbound_p,id_stbound_a,id_stbound_l] = getMgenLevels( m, 'ID_STBOUND' );  %#ok<ASGLU>
    [id_stpoint_i,id_stpoint_p,id_stpoint_a,id_stpoint_l] = getMgenLevels( m, 'ID_STPOINT' );  %#ok<ASGLU>
    [id_olateral_i,id_olateral_p,id_olateral_a,id_olateral_l] = getMgenLevels( m, 'ID_OLATERAL' );  %#ok<ASGLU>
    [id_rim_i,id_rim_p,id_rim_a,id_rim_l] = getMgenLevels( m, 'ID_RIM' );  %#ok<ASGLU>
    [s_rim_i,s_rim_p,s_rim_a,s_rim_l] = getMgenLevels( m, 'S_RIM' );  %#ok<ASGLU>
    [s_stbound_i,s_stbound_p,s_stbound_a,s_stbound_l] = getMgenLevels( m, 'S_STBOUND' );  %#ok<ASGLU>
    [s_tip_i,s_tip_p,s_tip_a,s_tip_l] = getMgenLevels( m, 'S_TIP' );  %#ok<ASGLU>

% Mesh type: volumetric

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                 KPAR         ----    ----       ----     ----
%                KPAR2         ----    ----       ----     ----
%                 KPER         ----    ----       ----     ----
%                  POL          0.1    0.01       ----     ----
%                 POL2          0.1    0.01       ----     ----
%           ID_ADAXIAL         ----    ----       ----     ----
%           ID_ABAXIAL         ----    ----       ----     ----
%              ID_PROX         ----    ----       ----     ----
%              ID_DIST         ----    ----       ----     ----
%          ID_MIDPLANE         ----    ----       ----     ----
%           ID_SURFACE         ----    ----       ----     ----
%              ID_BASE         ----    ----       ----     ----
%          ID_MERISTEM         ----    ----       ----     ----
%             ID_BLADE         ----    ----       ----     ----
%            S_ADAXIAL         0.05    0.01       ----     ----
%            S_ABAXIAL         0.05    0.01       ----     ----
%              V_RADII         ----    ----       ----     ----
%               V_DIST         ----    ----       ----     ----
%             V_CENTER         ----    ----       ----     ----
%               ID_MID         ----    ----       ----     ----
%              ID_EDGE         ----    ----       ----     ----
%          ID_PZMARGIN         ----    ----       ----     ----
%                S_MID         ----    0.01       ----     ----
%               S_EDGE          0.2    0.01       ----     ----
%           S_PZMARGIN         0.05    ----       ----     ----
%                ID_PZ         ----    ----       ----     ----
%          ID_BOUNDARY         ----    ----       ----     ----
%          ID_MIDPOINT         ----    ----       ----     ----
%           ID_CENTRAL         ----    ----       ----     ----
%           ID_LATERAL         ----    ----       ----     ----
%          ID_MARGINAL         ----    ----       ----     ----
%              ID_CORE         ----    ----       ----     ----
%              ID_APEX         ----    ----       ----     ----
%         ID_BOUNDARY1         ----    ----       ----     ----
%         ID_BOUNDARY2         ----    ----       ----     ----
%             ID_AXIAL         ----    ----       ----     ----
%                ID_CZ         ----    ----       ----     ----
%               S_PROX         ----    0.01       ----     ----
%            S_BOUNDPZ         0.01   0.001       ----     ----
%           ID_BOUNDPZ         ----    ----       ----     ----
%           S_MIDPLANE         ----   0.001       ----     ----
%         SUBDIVLENGTH         ----    ----       ----     ----
%           ID_STIPULE         ----    ----       ----     ----
%           ID_STBOUND         ----    ----       ----     ----
%           ID_STPOINT         ----    ----       ----     ----
%          ID_OLATERAL         ----    ----       ----     ----
%               ID_RIM         ----    ----       ----     ----
%                S_RIM         0.05    ----       ----     ----
%            S_STBOUND         0.01    ----       ----     ----
%                S_TIP         0.05    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
        
%         [RADII_RING,RADII_CENTER,id_boundary1_p,id_boundary2_p,id_boundary_p,id_meristem_p,id_cz_p] ...
        RADII_RING = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2);
        RADII_CENTER = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2 + m.FEnodes(:,3).^2);
        id_boundary1_p = double( (RADII_RING <= 0.5) &...
                                 (RADII_RING >= 0.35) &...
                                 (RADII_CENTER > 0.8) );
        id_boundary2_p = double( (m.FEnodes(:,3) <= 0.4) &...
                                 (m.FEnodes(:,3) >= 0.25) &...
                                 (RADII_CENTER > 0.8) );
        id_boundary_p = max( id_boundary1_p, id_boundary2_p );
        id_meristem_p = double( (m.FEnodes(:,3)<0.3)|(RADII_RING < 0.4) );
        id_cz_p = 1 - max( id_meristem_p, id_boundary_p ); % primordium zone (cz)
        subdivlength_p(:) = 1 - 0.5*(id_cz_p==1);
        % When subdivlength_p = 1, the normal subdivision edge length is used.
        % In general, subdivlength_p multiplies the subdivision edge length.
        % The smaller subdivlength_p, the more finely that part will be
        % subdivided.

% a central axial domain(CORE) orients shoot apical meristem growth
        radial = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2);
        id_core_p = double( radial<=0.01 );

 % a lateral axial domain (MODEL2)
        id_axial_p = double( (abs(m.FEnodes(:,2)) < 0.05)&...
                             (abs(m.FEnodes(:,1) + m.FEnodes(:,3)) < 0.058) );       
               
        side = [0, 0, 1];
        v_radii_p = sqrt((m.FEnodes(:,1)-side(1)).^2+...
                         (m.FEnodes(:,2)-side(2)).^2+...
                         ((m.FEnodes(:,3)-side(3))*0.8).^2);

        v_center_p = sqrt(m.FEnodes(:,1).^2 + m.FEnodes(:,2).^2 + m.FEnodes(:,3).^2);
        
        id_prox_p = double( m.FEnodes(:,3)==min(m.FEnodes(:,3)) );
        id_dist_p = double( (id_midplane_p == 1) & (v_center_p>0.95) );
        
        % base of mesh was fixed at the X-Y plane
        id_base_p = double( m.FEnodes(:,3) == min(m.FEnodes(:,3)) );
        m = leaf_fix_vertex(m, 'vertex', find(id_base_p == 1), 'dfs', 'z');
        
        id_blade_p = double( m.FEnodes(:,3)>0.25 );
        id_apex_p = double( (RADII_RING < 0.4)&(m.FEnodes(:,3)>0.3) );
        
        

        
   % surface domain is defined by cz and midplane domains
        switch OPTIONS.modelname
            
            case 'MODEL2'   %  no midplane domain
                id_surface_p((v_center_p > 0.95)&(~id_axial_p)&(id_cz_p)) = 1;   
                
            otherwise
                id_surface_p((v_center_p > 0.95)&(~id_midplane_p)&(id_cz_p)) = 1;
        end             
 
        % MID  a factor generated at the midline
        % EDGE a factor generated at the margin(rim) and diffuse towards a sink at the base 
        % opp a diffusible factor produced at the opposite end to the midline
        id_mid_p((~id_meristem_p)&(abs(m.FEnodes(:,2))<=0.05)&(m.FEnodes(:,1)<0)) = 1;
        s_mid_p = id_mid_p;
        m.morphogenclamp((id_mid_p == 1), s_mid_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_MID', 0.5 );
        m = leaf_mgen_absorption( m, 'S_MID', 0.01 );
        
        id_pzmargin_p((~id_meristem_p)&(abs(m.FEnodes(:,2))<=0.05)&(m.FEnodes(:,1)>0)) = 1;
        s_pzmargin_p = id_pzmargin_p;
        m.morphogenclamp((id_pzmargin_p == 1), s_pzmargin_i) = 1;
        m = leaf_mgen_conductivity( m, 's_pzmargin', 0.05 );
        m = leaf_mgen_absorption( m, 's_pzmargin', 0.01 );
        
        id_edge_p((id_midplane_p)&(RADII_CENTER > 0.95)&(~id_mid_p)) = 1;
        s_edge_p = id_edge_p-id_base_p;
        m.morphogenclamp((id_edge_p == 1)|(id_base_p == 1), s_edge_i) = 1;
        m = leaf_mgen_conductivity( m, 'S_EDGE', 0.2 );
        m = leaf_mgen_absorption( m, 'S_EDGE', 0.01 );

        % setup the tip point of midvein
        MIDPOINT = [-0.7, 0, 0.7];
        RADII_MIDPOINT = sqrt((m.FEnodes(:,1) - MIDPOINT(1)).^2 + ...
                              (m.FEnodes(:,2) - MIDPOINT(2)).^2 + ...
                              (m.FEnodes(:,3) - MIDPOINT(3)).^2);
        id_midpoint_p(RADII_MIDPOINT < 0.12) = 1;  
             
    end
    

         doSubdivision = false;
    if meshAtTime( m, 1 ) 
         subdivlength_p(:) = 1 - 0.8*((id_surface_p==1).*(id_cz_p==1));
         doSubdivision = true;
    end
    
    if meshAtTime( m, 2 )  
         switch OPTIONS.modelname   
            
            case 'MODEL2'
                % abaxialised eudicot mutant model
                id_abaxial_p(:) = 1;
                id_adaxial_p(:) = 0;
                
                s_abaxial_p=id_abaxial_p;
                 m.morphogenclamp((id_abaxial_p == 1), s_abaxial_i) = 1;
                 m = leaf_mgen_conductivity(m, 'S_ABAXIAL', 0.05);
                m = leaf_mgen_absorption(m, 'S_ABAXIAL', 0.01);

            otherwise                
        % setup the initial adaxial-abaxial system 
        side = [0, 0, 1];
        v_radii_p = sqrt((m.FEnodes(:,1)-side(1)).^2+...
                    (m.FEnodes(:,2)-side(2)).^2+...
                    ((m.FEnodes(:,3)-side(3))*0.8).^2);
        id_adaxial_p(v_radii_p <= 0.65) = 1;
        s_adaxial_p=id_adaxial_p;
        m.morphogenclamp((id_adaxial_p == 1), s_adaxial_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_ADAXIAL', 0.05);
        m = leaf_mgen_absorption(m, 'S_ADAXIAL', 0.01);

        id_abaxial_p(v_radii_p >= 0.75) = 1;
        s_abaxial_p=id_abaxial_p;
        m.morphogenclamp((id_abaxial_p == 1), s_abaxial_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_ABAXIAL', 0.05);
        m = leaf_mgen_absorption(m, 'S_ABAXIAL', 0.01);
        
         end
         % midplane domain is activated where both the signals fall below a threshold value
        id_midplane_p((s_adaxial_p<0.9)&(s_abaxial_p<0.9)&(~id_core_p)) = 1;
        
   

        switch OPTIONS.modelname  
            case {'MODEL1','MODEL6','MODEL8'}
        % the cz domain divided into three parts - central, lateral, and marginal - 
        % based on the value of a diffusible morphogen S_MID, using two thresholds 
        id_central_p((s_mid_p>=0.7)&(id_cz_p))=1; 
        id_marginal_p((s_mid_p<0.5)&(id_cz_p))=1; 
        id_lateral_p((id_cz_p)&(~id_marginal_p)&(~id_central_p))=1;
        id_pz_p = id_cz_p;  ... 
        id_midplane_p=id_midplane_p.*id_pz_p; ...    

         case {'MODEL3'}% Wildtype eudicot leaf
         % the cz domain divided into three parts - central, lateral, and marginal - 
        % based on the value of a diffusible morphogen S_MID, using two thresholds. lateral is further divided with olateral
        id_central_p( (s_mid_p>=0.85) & (id_cz_p) ) = 1;
        id_marginal_p( (s_mid_p<0.7) & (id_cz_p) & (s_mid_p>0.6) ) = 1;... 
        id_stipule_p( (s_mid_p<0.65) & (id_cz_p) & (id_marginal_p) ) = 1; ...
        id_stbound_p( (s_mid_p<0.67) & (id_cz_p) & (id_marginal_p)& (~id_stipule_p)) = 1;...
        id_pz_p = id_cz_p .* (s_mid_p>0.6);  ... 
        id_lateral_p( (id_pz_p) & (~id_marginal_p) & (~id_central_p) ) = 1;
        id_olateral_p( (id_lateral_p) & (s_mid_p< 0.75)  ) = 1;
        id_midplane_p = id_midplane_p .* id_pz_p; ...  
        id_stpoint_p((s_mid_p<0.64)&(s_mid_p>0.61)&(id_midplane_p) &(id_surface_p))=1;...

        case {'MODEL2'}%Abaxial mutant leaf 
         % the CZ hasa single central domain   
        id_central_p((s_mid_p>=0.85)&(id_cz_p))=1;
        id_pz_p = id_central_p;  ... 
 
        case 'MODEL4' % Eudicot prs mutant leaf 
         % the cz domain divided into two parts - central, lateral   
        % based on the value of a diffusible morphogen S_MID, using two
        % thresholds lateral is further divided with olateral
        id_central_p((s_mid_p>=0.85)&(id_cz_p))=1;
        id_lateral_p((id_cz_p)&(s_mid_p>0.7)&(~id_central_p))=1;
        id_olateral_p( (id_lateral_p) & (s_mid_p< 0.75)  ) = 1;
        id_pz_p((id_cz_p)&(s_mid_p>0.7))=1;  ... 
        id_midplane_p=id_midplane_p.*id_pz_p; ...  
        
       case 'MODEL5' %Eudicot prs wox1 mutant leaf
         % the cz domain divided into two parts - central, lateral - 
        % based on the value of a diffusible morphogen S_MID, using two thresholds 
        id_central_p((s_mid_p>=0.85)&(id_cz_p))=1;
        id_lateral_p((id_cz_p)&(s_mid_p>0.75)&(~id_central_p))=1;
        id_pz_p((id_cz_p)&(s_mid_p>0.75))=1;  ... 
        id_midplane_p=id_midplane_p.*id_pz_p; ...  
        
        case {'MODEL7'} %Narrowsheath mutant leaf
        % the cz domain divided into two parts - central, lateral- 
        % based on the value of a diffusible morphogen S_MID, using two thresholds 
        id_central_p((s_mid_p>=0.7)&(id_cz_p))=1;
        id_lateral_p((id_cz_p)&(s_mid_p>0.5)&(~id_central_p))=1;
        id_pz_p((id_cz_p)&(s_mid_p>0.46))=1;  ... 
        id_midplane_p=id_midplane_p.*id_pz_p; ...   

        end 
               
        switch OPTIONS.modelname
            
            case 'MODEL2' % In the abaxial mutant replace the midplane domain with a lateral axial domain
                pol_p = id_surface_p - id_core_p - id_axial_p;
                m.morphogenclamp((id_surface_p == 1)|(id_core_p == 1)|...
                                 (id_axial_p == 1), pol_i) = 1;
              
                m = leaf_mgen_conductivity( m, 'POL', 0.1 );
                m = leaf_mgen_absorption( m, 'POL', 0.01 );
                
            otherwise
                pol_p = id_surface_p - id_midplane_p - id_core_p;
                m.morphogenclamp((id_surface_p == 1)|(id_core_p == 1)|...
                                 (id_midplane_p == 1), pol_i) = 1;
               
                m = leaf_mgen_conductivity( m, 'POL', 0.1 );
                m = leaf_mgen_absorption( m, 'POL', 0.01 );
        end
         
        id_boundpz_p =(1-id_pz_p);        
        s_boundpz_p = id_boundpz_p;
        m.morphogenclamp((id_boundpz_p == 1), s_boundpz_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_BOUNDPZ', 0.01);
        m = leaf_mgen_absorption(m, 'S_BOUNDPZ', 0.1); %
        
        s_stbound_p = id_stbound_p;
        m.morphogenclamp((id_stbound_p == 1), s_stbound_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_STBOUND', 0.01);
        m = leaf_mgen_absorption(m, 'S_STBOUND', 0.1); %
        
        s_midplane_p = (id_midplane_p +id_axial_p).*(v_center_p > 0.95);
        m.morphogenclamp((id_midplane_p == 1)| (id_axial_p == 1), s_midplane_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_MIDPLANE', 0.01);
        m = leaf_mgen_absorption(m, 'S_MIDPLANE', 0.001); %
        
        id_rim_p= id_midplane_p.*id_surface_p;
        
        s_rim_p = id_rim_p;
        m.morphogenclamp((id_rim_p == 1), s_rim_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_RIM', 0.05);
        m = leaf_mgen_absorption(m, 'S_RIM', 0.05); %
        
        s_tip_p = id_midpoint_p;
        m.morphogenclamp((id_midpoint_p == 1), s_tip_i) = 1;
        m = leaf_mgen_conductivity(m, 'S_TIP', 0.05);
        m = leaf_mgen_absorption(m, 'S_TIP', 0.05); %

        
         switch OPTIONS.modelname
            
            case {'MODEL1', 'MODEL8'}   % no proximodistal polarity field
                pol2_p = 0;
                
             otherwise
                 %establish the proximodistal polarity field
                pol2_p = 0.5 * (id_boundpz_p + id_stbound_p) - id_midpoint_p -id_core_p.*(v_center_p > 0.95)-id_stpoint_p;...
                m.morphogenclamp((id_midpoint_p == 1)|(id_boundpz_p == 1)|(id_stbound_p == 1)|(id_stpoint_p == 1)|((id_core_p.*(v_center_p > 0.95))==1), pol2_i) = 1;...STIPULE
                m = leaf_mgen_conductivity( m, 'POL2', 0.1 );
                m = leaf_mgen_absorption( m, 'POL2', 0.01 ); 
         end              
    end 
    
    if meshAfterTime( m, 2 ) && meshBeforeTime( m, 20 ) 
 
        m = leaf_mgen_conductivity(m, 'S_MIDPLANE', 0);
        
        m = leaf_mgen_conductivity( m, 'S_MID', 0.0 );
        m = leaf_mgen_absorption( m, 'S_MID', 0.0 );

         % if (realtime > 4) 
         if meshAfterTime( m, 4 )
        m = leaf_mgen_conductivity(m, 'S_BOUNDPZ', 0);   
        m = leaf_mgen_conductivity( m, 'S_STBOUND', 0.0 );
        m = leaf_mgen_absorption( m, 'S_STBOUND', 0.0 );
        m = leaf_mgen_conductivity(m, 'S_RIM', 0.0);
        m = leaf_mgen_absorption(m, 'S_RIM', 0.0); %
         end       
         
        % @@ KRN Growth Rate Regulatory Network
        % kpar: growth rate parallel to the orthoplanar polarity field (Kop)
        % kpar2: growth rate parallel to the proximodistal polarity field (Kpd)
        % kper: growth rate perpendicular to both polarity fields (Kper)
        
        switch OPTIONS.modelname  
            case {'MODEL1'}  % high growth perpendicular to the orthoplanar polarity field in the pz domain Fig.2C to D
                kpar_p = 0.08 * id_apex_p;      
                kpar2_p = 0.08*id_apex_p + 0.4* id_pz_l;...
                kper_p = kpar2_p;
              
              case {'MODEL2', 'MODEL3','MODEL4','MODEL5'} 
                kpar_p = 0.08*id_apex_p;      
                kpar2_p = 0.08*id_apex_p + 0.4*(id_central_p + 0.8*id_lateral_p + 0.3 * id_marginal_p)...
                           .* id_pz_p.* inh(5,s_pzmargin_l).*pro(0.3, id_abaxial_l).*(0.1 + (s_rim_l<0.7));...     
                kper_p =   0.04*id_apex_p...
                           +  0.1*id_pz_p.*(id_central_l+id_lateral_l)...
                           .*pro(2, (s_mid_l<0.95).*pro(0.3, id_abaxial_l).*inh(0.5, s_tip_l).*(s_rim_l>0.5).* inh(5,s_pzmargin_l)).*inh(1, (s_mid_l>0.95));... 
                    
              case {'MODEL6', 'MODEL7'} 
                kpar_p = 0.08*id_apex_p;      
                kpar2_p = 0.08*id_apex_p + 0.4*(id_central_p + 0.8*id_lateral_p + 0.3 * id_marginal_p)...
                           .* id_pz_p.* inh(5,s_pzmargin_l).*pro(0.3, id_abaxial_l).*(0.1 + (s_rim_l<0.7));...     
                kper_p =   0.04*id_apex_p...
                           +  0.1*id_pz_p.*(id_central_l+id_lateral_l)...
                           .*pro(2, (s_mid_l<0.95).*pro(0.3, id_abaxial_l).*inh(0.5, s_tip_l).*(s_rim_l>0.5).* inh(5,s_pzmargin_l)).*inh(1, (s_mid_l>0.95));... 
                
               case {'MODEL8'}
                kpar_p = 0.08*id_apex_p;      
                kpar2_p = 0.08*id_apex_p...
                        + 0.4*(id_central_p + 0.8*id_lateral_p + 0.3*id_marginal_p).* id_pz_l.* inh(5,s_pzmargin_l);...
                kper_p = kpar2_p;
                
        end
        
    end
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

    m.morphogens(:,kpar_i) = kpar_p;
    m.morphogens(:,kpar2_i) = kpar2_p;
    m.morphogens(:,kper_i) = kper_p;
    m.morphogens(:,pol_i) = pol_p;
    m.morphogens(:,pol2_i) = pol2_p;
    m.morphogens(:,id_adaxial_i) = id_adaxial_p;
    m.morphogens(:,id_abaxial_i) = id_abaxial_p;
    m.morphogens(:,id_prox_i) = id_prox_p;
    m.morphogens(:,id_dist_i) = id_dist_p;
    m.morphogens(:,id_midplane_i) = id_midplane_p;
    m.morphogens(:,id_surface_i) = id_surface_p;
    m.morphogens(:,id_base_i) = id_base_p;
    m.morphogens(:,id_meristem_i) = id_meristem_p;
    m.morphogens(:,id_blade_i) = id_blade_p;
    m.morphogens(:,s_adaxial_i) = s_adaxial_p;
    m.morphogens(:,s_abaxial_i) = s_abaxial_p;
    m.morphogens(:,v_radii_i) = v_radii_p;
    m.morphogens(:,v_dist_i) = v_dist_p;
    m.morphogens(:,v_center_i) = v_center_p;
    m.morphogens(:,id_mid_i) = id_mid_p;
    m.morphogens(:,id_edge_i) = id_edge_p;
    m.morphogens(:,id_pzmargin_i) = id_pzmargin_p;
    m.morphogens(:,s_mid_i) = s_mid_p;
    m.morphogens(:,s_edge_i) = s_edge_p;
    m.morphogens(:,s_pzmargin_i) = s_pzmargin_p;
    m.morphogens(:,id_pz_i) = id_pz_p;
    m.morphogens(:,id_boundary_i) = id_boundary_p;
    m.morphogens(:,id_midpoint_i) = id_midpoint_p;
    m.morphogens(:,id_central_i) = id_central_p;
    m.morphogens(:,id_lateral_i) = id_lateral_p;
    m.morphogens(:,id_marginal_i) = id_marginal_p;
    m.morphogens(:,id_core_i) = id_core_p;
    m.morphogens(:,id_apex_i) = id_apex_p;
    m.morphogens(:,id_boundary1_i) = id_boundary1_p;
    m.morphogens(:,id_boundary2_i) = id_boundary2_p;
    m.morphogens(:,id_axial_i) = id_axial_p;
    m.morphogens(:,id_cz_i) = id_cz_p;
    m.morphogens(:,s_prox_i) = s_prox_p;
    m.morphogens(:,s_boundpz_i) = s_boundpz_p;
    m.morphogens(:,id_boundpz_i) = id_boundpz_p;
    m.morphogens(:,s_midplane_i) = s_midplane_p;
    m.morphogens(:,subdivlength_i) = subdivlength_p;
    m.morphogens(:,id_stipule_i) = id_stipule_p;
    m.morphogens(:,id_stbound_i) = id_stbound_p;
    m.morphogens(:,id_stpoint_i) = id_stpoint_p;
    m.morphogens(:,id_olateral_i) = id_olateral_p;
    m.morphogens(:,id_rim_i) = id_rim_p;
    m.morphogens(:,s_rim_i) = s_rim_p;
    m.morphogens(:,s_stbound_i) = s_stbound_p;
    m.morphogens(:,s_tip_i) = s_tip_p;

%%% USER CODE: FINALISATION

    % This code cannot go in the USER CODE: MORPHOGEN INTERACTIONS section,
    % because it changes the structure of the mesh.
    % It cannot go in the USER CODE: INITIALISATION section, because
    % subdivlength_p is not available there.
   ... if meshAtOrBeforeTime( m, 0 ) && any( subdivlength_p ~= 1)
    ...    [m,numsplit,numunsplit] = leaf_remesh( m, 'longedges', true, 'repeat', 5 );
   ... end
    
    
   if doSubdivision 
        [m,numsplit,numunsplit] = leaf_remesh( m, 'longedges', true, 'repeat', 5 );... was repeat 5
        [m,numsplit,numunsplit] = leaf_remesh( m, 'longedges', true, 'repeat', 5 );... was repeat 5
        [m,numsplit,numunsplit] = leaf_remesh( m, 'longedges', true, 'repeat', 5 );... was repeat 5
    end
%%% END OF USER CODE: FINALISATION

end

function [m,result] = ifCallbackHandler( m, fn, varargin )
    result = [];
    if exist(fn,'file') ~= 2
        return;
    end
    [m,result] = feval( fn, m, varargin{:} );
end


%%% USER CODE: SUBFUNCTIONS

% Here you may write any functions of your own, that you want to call from
% the interaction function, but never need to call from outside it.
% Remember that they do not have access to any variables except those
% that you pass as parameters, and cannot change anything except by
% returning new values as results.
% Whichever section they are called from, they must respect the same
% restrictions on what modifications they are allowed to make to the mesh.

% The GFtbox_..._Callback routines can be deleted if you do not use them.
% Those that you retain will be automatically called by GFtbox at certain
% points in the simulation cycle.
% If you retain them, their headers specifying their arguments and results
% must not be altered.

function [m,result] = GFtbox_Precelldivision_Callback( m, ci ) %#ok<DEFNU>
    result = [];
    % Your code here.

    % If a nonempty result is to be returned, it should be a struct
    % with fields result.divide, result.dividepoint, and result.perpendicular.
end

function [m,result] = GFtbox_Postcelldivision_Callback( m, ci, cei, newci, newcei, oe1, oe2, ne1, ne2, ne3 ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postiterate_Callback( m ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Preplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

